import React from 'react';
import styled from 'styled-components';
import Curve from '../images/curve.svg';
import SearchBox from './SearchBox';

const S = {};
S.Curve = styled.div`
.curve-container {
  margin: auto;
  position: relative;
}

.curve-image {
  width: 100%;
}

  @media only screen and (max-width: 600px) { 
    .search-container {
      top: 65px;
      max-width: 250px;
    }
  }
`;

export default function Header() {
  return (
    <S.Curve>
      <div className="curve-container">
        <SearchBox />
        <img src={Curve} alt="Curve" className="curve-image" />
      </div>
    </S.Curve>
  )
}
