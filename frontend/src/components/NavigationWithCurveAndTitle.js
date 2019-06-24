import React from 'react';
import styled from 'styled-components';
import Navigation from '../components/Navigation';

const S = {};
S.NacigationWithCurveAndTitle = styled.header`
max-width: 1440px;
margin: auto;
position: relative;

.title {
  padding: ${props => props.fixedPadding || 30}px 15%;
  background-color: ${props => props.theme.colors.backgroundSecondary};
  h1 {
    margin-block-start: 0px;
    margin-block-end: 0px;
  }
}

.topcurve {
  display: block;
  position: relative;
  top: 0;
  z-index: -100;
  left: 0;
  right: 0;

  svg {
    width: 100%;
    path {
      fill: ${props => props.theme.colors.backgroundSecondary};
    }
  }
}

@media only screen and (max-width: 767px) {
  padding: 0px;

  .title {
    padding: 5%;
    h1 {
      padding-top: 0px;
    }
  }

  .navigation {
    background-color: ${props => props.theme.colors.backgroundSecondary};
    width: 100%;
    padding: 0;
    z-index: 30;
    position: relative;
  }
} 
`;

const NavigationWithCurveAndTitle = (props) => {
  const {title, fixedPadding, isLoading} = props;

  const curve = (color) =>
    <svg viewBox="0 0 1440 72" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <title>Top Curve</title>
      <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
        <g id="Desktop---contact" transform="translate(0.000000, -280.000000)" fill="#6DE5B8">
            <path d="M0,426 L0,280 L1440,280 L1440,426 L1440,352 C1212.66667,305.333333 973,282 721,282 C469,282 228.666667,305.333333 0,352 L0,426 Z" id="Combined-Shape"></path>
        </g>
      </g>
    </svg>

  return (
    <S.NacigationWithCurveAndTitle fixedPadding={fixedPadding}>
      <div className='navigation'>
        <Navigation textHighlightColor="backgroundPrimary" backgroundColor="backgroundSecondary"/>
      </div>
      <div className='title' aria-live="polite" aria-busy={isLoading} aria-atomic={true}>
        <h1>
          {title}
        </h1>
      </div>
      <div className='topcurve' aria-hidden={true}>
        {curve()}
      </div>
    </S.NacigationWithCurveAndTitle>
  );
}
  
export default NavigationWithCurveAndTitle;