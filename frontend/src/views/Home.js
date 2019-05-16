import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import headerBgNoImage from '../images/headerbg_noimage.svg';
import headerBgClipped from '../images/header-hole.svg';
import headerImage from '../images/headerimage.jpg';

const S = {};
S.Home = styled.div`
  ::before {
    content: " ";
    position: absolute;
    width: 100%;
    height: 1100px;
    z-index: -1;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url(${headerBgClipped}); 
  }
  ::after {
     content: "";
    position: absolute;
    top: 0;
    left: 50%;
    width: 70%;
    max-height: 900px;
    overflow: hidden;
    background-repeat: no-repeat;
    height: 120%;
    background-size: cover;
    z-index: -10;
    transform: rotate(180deg);
    background-image: url(${headerImage});
  }

  @media only screen and (max-width: 840px) { 
    ::before {
      background-image: url(${headerBgNoImage});
    }
    ::after {
      content: none;
    }
  }
`;

const Home = () => {
  const showResults = (schoolOrOrganizationSelection, competenceOrDegreeSelection) => {
    if (schoolOrOrganizationSelection && competenceOrDegreeSelection) {
      console.log('Show results');
    }
    console.log('competenceOrDegreeSelection', competenceOrDegreeSelection);
    console.log('schoolOrOrganizationSelection', schoolOrOrganizationSelection);
  }

  return (
    <S.Home>
      <Header showResults={showResults}/>
      <div>Contentti</div>
    </S.Home>
  );
}

export default Home;
