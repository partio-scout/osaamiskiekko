import React, { useState, useEffect } from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import * as Api from '../api/Api';
import ListSchools from '../components/ListSchools';

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
  const [selectedCarouselField, setSelectedCarouselField] = useState({});
  const [nqfLevels, setNqfLevels] = useState(null);
  const [fieldOfStudies, setFieldOfStudies] = useState(null);

   useEffect(() => {
     const fetchFieldsAndNqfData = async () => {
       const nqfs = await Api.getNqfs();
       setNqfLevels(nqfs);
       const fieldOfStudies = await Api.getFieldofstudies();
       setFieldOfStudies(fieldOfStudies);
     }
     fetchFieldsAndNqfData();
   }, []);

  const getSelectedCarouselField = (field) => {
    setSelectedCarouselField(field)
  }

  const getMatchingDegrees = async (competence) => {
    const competences = await Api.getCompetencedegreelinksWithId(competence.id);
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
        {
          selectedCarouselField &&
          <ListSchools selectedCarouselField={selectedCarouselField} nqfLevels={nqfLevels}/>
        }
      </div>
    </S.Home>
  );
}

export default Home;
