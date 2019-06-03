import React, { useState } from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import * as Api from '../api/Api';
import ListSchools from '../components/search/ListSchools';
import { orderBy } from 'lodash';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.Home = styled.div`
  max-width: 1440px;
  margin: auto;

  @media only screen and (max-width: 767px) {
    padding: 0px;
  } 
`;

const Home = () => {
  const [sortedCarouselFields, setSortedCarouselFields] = useState([]);
  const [sortedSchoolList, setSortedSchoolList] = useState([]);
  const globalState = useGlobalStateContext();
  const { isLoading, schools, organizations } = globalState;

  const data = (schools && organizations ? [...schools, ...organizations] : []);

  const sortSchools = selectedCarouselField => {
    const schoolList = globalState.nqfLevels.map(nqf => {
      return {
        ...nqf,
        degree: selectedCarouselField.competences.filter(competence => competence.academicdegree.nqf === nqf.id)
      }
     });
    const sortedSchoolList = orderBy(schoolList, [(item) => item.degree.length], ['desc'])
    setSortedSchoolList(sortedSchoolList);
  } 

  const setSelectedCarouselField = field => sortSchools(field);

  const sortCarouselItems = (carouselFields) => {
    const sortedFields = orderBy(carouselFields, [(item) => item.competences.length], ['desc'])
    setSortedCarouselFields(sortedFields);
    sortSchools(sortedFields[0]);
  }

  const getMatchingDegrees = async (competence) => {
    const competences = await Api.getCreditingInfosForCompetence(competence.id);
    const carouselFields = globalState.fieldOfStudies.map(field => ({
      ...field, 
      competences: competences.filter(competence => competence.academicdegree.fieldofstudy === field.id)
    }));
    sortCarouselItems(carouselFields);
  }

  const showResults = (institution, competenceOrDegreeSelection) => {
    if (institution && competenceOrDegreeSelection) {
      if (institution.type_en === 'Organization') {
        getMatchingDegrees(competenceOrDegreeSelection);
      }
    }
  }

  return (
    <S.Home>
      <Header 
        showResults={showResults}
        data={data} 
        isLoading={isLoading}
        sortedCarouselFields={sortedCarouselFields}
        setSelectedCarouselField={setSelectedCarouselField}/>
      <ListSchools sortedSchoolList={sortedSchoolList} />
    </S.Home>
  );
}

export default Home;
