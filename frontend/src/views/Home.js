import React, { useState } from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import * as Api from '../api/Api';

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
  const { data, isLoading } = getSchoolsAndOrganizations();
  const [carouselFields, setCarouselFields] = useState([]);

  const getSelectedCarouselField = (field) => {
    console.log('FIELD', field);
  }

  const getMatchingDegrees = async (competence) => {
    const competences = await Api.getCompetencedegreelinksWithId(competence.id);
    const fieldOfStudies = await Api.getFieldofstudies();
    const carouselFields = fieldOfStudies.map(field => ({
      ...field, 
      competences: competences.filter(competence => competence.academicdegree.fieldofstudy === field.id)
    }));
    setCarouselFields(carouselFields);
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
        carouselFields={carouselFields}
        getSelectedCarouselField={getSelectedCarouselField}/>
      <div className="content-area">
          content area
      </div>
    </S.Home>
  );
}

export default Home;
