import React from 'react';
import Header from '../components/Header.js';
import styled from 'styled-components';
import headerBg from '../images/headerbg.svg';

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
`;

const Contact = () => {
  return (
    <S.Home>
      <Header />
      <div>Contact page</div>
    </S.Home>
  );
}

export default Contact;
