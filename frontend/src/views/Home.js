import React, { useState } from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import * as Api from '../api/Api';
import ListSchools from '../components/ListSchools';
import { orderBy } from 'lodash';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import getInstitutions from '../api/GetInstitutions';

const S = {};
S.Home = styled.div`
  max-width: 1440px;
  margin: auto;
  padding-left: 20px;
  padding-right: 20px;

  @media only screen and (max-width: 860px) {
    padding: 0px;
  } 
`;

const Home = () => {
  const [sortedCarouselFields, setSortedCarouselFields] = useState([]);
  const [sortedSchoolList, setSortedSchoolList] = useState([]);
  const globalState = useGlobalStateContext();
  const { data, isLoading } = getInstitutions();

  const sortSchools = selectedCarouselField => {
    const schoolList = globalState.nqfLevels.map(level => {
      const lvl = parseInt(level.level);
      return {
        ...level,
        degree: selectedCarouselField.competences.filter(competence => competence.academicdegree.nqf === lvl)
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
    const competences = await Api.getCompetencedegreelinksWithId(competence.id);
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
      <div className="content-area">
        <ListSchools sortedSchoolList={sortedSchoolList} />
      </div>
    </S.Home>
  );
}

export default Home;
