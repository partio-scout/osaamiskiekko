import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
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

`;

const Information = () => {
  return (
    <S.Home>
      <Header />
      <div>Information page</div>
    </S.Home>
  );
}

export default Information;
