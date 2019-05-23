import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';

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

  const showResults = (schoolOrOrganizationSelection, competenceOrDegreeSelection) => {
    if (schoolOrOrganizationSelection && competenceOrDegreeSelection) {
      console.log('Show results');
    }
    console.log('competenceOrDegreeSelection', competenceOrDegreeSelection);
    console.log('schoolOrOrganizationSelection', schoolOrOrganizationSelection);
  }

  return (
    <S.Home>
      <Header showResults={showResults} data={data} isLoading={isLoading} />
      <div className="content-area">
          content area
      </div>
    </S.Home>
  );
}

export default Home;
