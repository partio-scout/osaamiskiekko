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
    right: 0;
    width: 100%;
    background-repeat: no-repeat;
    height: 100%;
    background-size: cover;
    z-index: -10;
    background-position: 100% 80%;
    background-image: url(${headerImage});
  }

  @media only screen and (max-width: 840px) { 
    ::before {
    background-image: url(${headerBgNoImage});
    }
  }
`;

const Home = () => {
  const showResults = (schoolOrOrganizationSelection, competenceOrDegreeSelection) => {
    console.log('competenceOrDegreeSelection', competenceOrDegreeSelection);
    console.log('schoolOrOrganizationSelection', schoolOrOrganizationSelection);
  }

  return (
    <S.Home>
      <Header {...{showResults}}/>
      <div>Contentti</div>
    </S.Home>
  );
}

export default Home;
