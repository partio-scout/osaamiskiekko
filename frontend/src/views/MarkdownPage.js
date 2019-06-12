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
  padding: 30px 15% 30px 15%;
  background-color: ${props => props.theme.colors.backgroundSecondary};
  h1 {
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
  margin-bottom: 3rem;
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
    margin: 0 0 0 0;
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
    <svg viewBox="0 0 1440 72" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <title>Top Curve</title>
      <g id="Visual" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="Desktop---contact" transform="translate(0.000000, -280.000000)" fill="#6DE5B8">
            <path d="M0,426 L0,280 L1440,280 L1440,426 L1440,352 C1212.66667,305.333333 973,282 721,282 C469,282 228.666667,305.333333 0,352 L0,426 Z" id="Combined-Shape"></path>
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
              : <><FormattedMessage id='error.title'/>{status.message}</>}
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