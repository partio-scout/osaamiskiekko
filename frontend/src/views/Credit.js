import React from 'react';
import styled from 'styled-components';
import Navigation from '../components/Navigation';
import CreditingInfo from '../components/CreditingInfo';
import CreditingData from '../api/CreditingData';

const S = {};
S.Credit = styled.div`
max-width: 1440px;
margin: auto;
position: relative;

.topcurve {
  display: block;
  position: absolute;
  z-index: -100;
  top: 0;
  left: 0;
  right: 0;

  svg {
    width: 100%;
    path {
      fill: ${props => props.theme.colors.backgroundSecondary};
    }
  }
}

.navigation {
  padding: 0 10%;
}

.content {
  margin-top: 3rem;
  padding: 0 15%;
  position: relative;
}

@media only screen and (max-width: 860px) {
  padding: 0px;

  .navigation {
    padding: 0 1rem;
  }

  .content {
    margin-top: 1rem;
    padding: 0 1rem;
  }
} 
`;

const Credit = (props) => {
  const { data, isLoading } = CreditingData(props.match.params.id);

  const svgCurve = (color) =>
    <svg viewBox="0 0 1440 352" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <title>Top Curve</title>
      <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
        <g id="Desktop---info" fill="#6DE5B8">
          <path d="M0.295915256,351.939623 L0.999306037,0 L1440,0 L1440,426 L1440,352 C1212.66667,305.333333 973,282 721,282 C469.108701,282 228.874006,305.313208 0.295915256,351.939623 Z" id="top-curve"></path>
        </g>
      </g>
    </svg>

  return (
    <S.Credit>
      <div className='topcurve'>
        {svgCurve()}
      </div>
      <div className='navigation'>
        <Navigation />
      </div>
      <div className='content'>
        <CreditingInfo creditingData={data} isLoading={isLoading}  />
      </div>
    </S.Credit>
  );
}

export default Credit;
