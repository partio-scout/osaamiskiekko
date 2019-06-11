import React, { useEffect } from 'react';
import Helmet from 'react-helmet';
import { FormattedMessage } from 'react-intl';
import Markdown from 'markdown-to-jsx';
import styled from 'styled-components';
import Navigation from '../components/Navigation';
import MarkdownData from '../api/MarkdownData';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.MarkdownPage = styled.div`
max-width: 1440px;
margin: auto;
position: relative;

.title {
  padding: 0 156px 0 156px;
  background-color: ${props => props.theme.colors.backgroundSecondary};
  h1 {
    padding-top: 30px;
    margin-block-start: 0px;
    margin-block-end: 0px;
  }
}

.navigation {
  background-color: ${props => props.theme.colors.backgroundSecondary};
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

.content {
  margin-top: 3rem;
  padding: 0 15%;
  position: relative;
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

  .content {
    margin-top: 0;
    padding: 5%;
    z-index: 20;
  }
} 
`;

const MarkdownPage = (props) => {
  let contentContainer;
  const { data, isLoading, status } = MarkdownData(props.match.params.pageName);
  const globalState = useGlobalStateContext();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [contentContainer]);

  const curve = (color) =>
    <svg viewBox="0 0 1439.7041 91" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <title>Top Curve</title>
      <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
        <g id="Desktop---info" fill="#6DE5B8">
          <path d="M 0.29591526,351.93962 0.99930604,0 H 1440 V 426 352 C 1212.6667,305.33333 973,282 721,282 469.1087,282 228.87401,305.31321 0.29591526,351.93962 Z" id="top-curve"></path>
        </g>
      </g>
    </svg>


  //TODO proper title and pageTitle
  return (
    <S.MarkdownPage>
      <Helmet>
        <title>
          {isLoading
            ? ''
            : typeof data !== 'undefined'
              ? data[`title_${globalState.language}`]
              : 'Error'}
        </title>
      </Helmet>
      <div className='navigation'>
        <Navigation />
      </div>
      <div className='title'>
        <h1>
          {isLoading
            ? ''
            : typeof data !== 'undefined'
              ? <>{data[`title_${globalState.language}`]}</>
              : <><FormattedMessage id='error.title'/>{status}</>}
        </h1>
      </div>
      <div className='topcurve' aria-hidden={true}>
        {curve()}
      </div>
      <div className='content'>
        <div ref={(container) => { contentContainer = container; }} tabIndex="-1" aria-labelledby="pageTitle">
          {isLoading 
            ? ''
            : typeof data !== 'undefined'
              ? <Markdown>{data[`text_${globalState.language}`]}</Markdown>
              : <FormattedMessage id='error.text'/>}
        </div>
      </div>
    </S.MarkdownPage>
  );
}
  
export default MarkdownPage;