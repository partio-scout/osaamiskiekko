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
  const [sortedCarouselFields, setSortedCarouselFields] = useState([]);
  const [nqfLevels, setNqfLevels] = useState(null);
  const [fieldOfStudies, setFieldOfStudies] = useState(null);
  const [sortedSchoolList, setSortedSchoolList] = useState([]);

   useEffect(() => {
     const fetchFieldsAndNqfData = async () => {
       const nqfs = await Api.getNqfs();
       setNqfLevels(nqfs);
       const fieldOfStudies = await Api.getFieldofstudies();
       setFieldOfStudies(fieldOfStudies);
     }
     fetchFieldsAndNqfData();
   }, []);

  const sortSchools = async (selectedCarouselField) => {
    // const nqfs = await Api.getNqfs();
    const schoolList = nqfLevels.map(level => {
      const lvl = parseInt(level.level);
      return {
        ...level,
        degree: selectedCarouselField.competences.filter(competence => competence.academicdegree.nqf === lvl)
      }
     });

    const sortedSchoolList = schoolList.sort((a, b) => {
      if (a.degree && b.degree) {
        // ASC  -> a.length - b.length
        // DESC -> b.length - a.length
        return b.degree.length - a.degree.length;
      }
      return null;
    });
    // setSelectedCarouselField(sortedSchoolList[0])
    setSortedSchoolList(sortedSchoolList);
   console.log('järkäs', sortedSchoolList);
  } 

  const setSelectedCarouselField = (field) => {
    sortSchools(field);
  }

  const sortCarouselItems = (carouselFields) => {
    const sortedFields = carouselFields.sort((a, b) => {
      if (a.competences && b.competences) {
        // ASC  -> a.length - b.length
        // DESC -> b.length - a.length
        return b.competences.length - a.competences.length;
      }
      return null;
    });
    setSortedCarouselFields(sortedFields);
    setSelectedCarouselField(sortedFields[0]);
  }

  const getMatchingDegrees = async (competence) => {
    const competences = await Api.getCompetencedegreelinksWithId(competence.id);
    const carouselFields = fieldOfStudies.map(field => ({
      ...field, 
      competences: competences.filter(competence => competence.academicdegree.fieldofstudy === field.id)
    }));
    // setCarouselFields(carouselFields);
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
