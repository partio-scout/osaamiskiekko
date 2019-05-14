import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import headerBg from '../images/headerbg.svg';
import headerBgNoImage from '../images/headerbg_noimage.svg';

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
    background-image: url(${headerBg});
  }

  @media only screen and (max-width: 840px) { 
    ::before {
    background-image: url(${headerBgNoImage});
  }
  }
`;

const Home = () => {
  return (
    <S.Home>
      <Header />
      <div>Contentti</div>
    </S.Home>
  );
}

export default Home;
