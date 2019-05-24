import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';

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

const Information = () => {
  return (
    <S.Home>
      <Header />
      <div>Information page</div>
    </S.Home>
  );
}

export default Information;
