import React from 'react';
import styled from 'styled-components';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { FormattedMessage } from 'react-intl';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { Link } from 'react-router-dom';

const S = {};
S.CreditingInfo = styled.div`
display: grid;
grid-template-areas: 
  "header header"
  "degree-info competence-info" 
  "credit-info credit-info"
  "degree-description competence-description" 
  "footer footer";
grid-template-columns: 4fr 4fr;
padding: 2rem;
box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
border-radius: 8px;
background-color: ${props => props.theme.colors.backgroundPrimary}
position: relative;
z-index: 20;

.half-background {
  background-color: ${props => props.theme.colors.backgroundTertiary}
  position: absolute;
  top: 0;
  left: 50%;
  right: 0;
  bottom: 0;
  z-index: -10;
}

.header {
  z-index: 10;
  grid-area: header;

  i {
    font-size: 30px;
    margin-right: 1rem;
  }

  i, a {
    color: ${props => props.theme.colors.textColor}
    text-decoration: none;
  }
}

.degree-info {
  padding-right: 5rem;
  grid-area: degree-info;

  h2 {
    margin-top: 0;
  }
}
.competence-info {
  padding-left: 3rem;
  grid-area: competence-info;
}
.credit-info {
  grid-area: credit-info;
  padding: 1rem 3rem;
  z-index: 10;

  .floating-box {
    padding: 1rem 2rem;
    background-color: ${props => props.theme.colors.backgroundPrimary}
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
    border-radius: 8px;
  }
}

.degree-description {
  padding-right: 5rem;
  grid-area: degree-description;
}
.competence-description {
  padding-left: 3rem;
  grid-area: competence-description;
}
.footer {
  grid-area: footer;
  z-index: 10;
  display: flex;
  flex-direction: column;
  align-items: center;

  button {
    margin: auto;
    font-size: 16px;	
    line-height: 24px;	
    text-align: center;
    border-radius: 6px;	
    color: ${props => props.theme.colors.textColorLight};
    background-color: ${props => props.theme.colors.highlight};
    padding: 1rem; 

    span {
      text-transform: uppercase;
      letter-spacing: 4px;
    }
  }
}

.topcurvemobile {
  display: none;
}

.error {
  grid-area: header;
}

@media only screen and (max-width: 767px) {
  grid-template-columns: 4fr;
  grid-template-areas: 
    "header"
    "degree-info"
    "credit-info"
    "degree-description"
    "curve"
    "competence-info" 
    "competence-description" 
    "footer";
  padding: 0;
  border: none;
  box-shadow: none;
  background: none;

  .half-background {
    display: none;
  }

  .header, .footer, .credit-info, .degree-info, .competence-info, .degree-description, .competence-description {
    padding: 0.5rem;
    background: none;
  }

  .degree-info, .degree-description, .credit-info, .header {
    background-color: ${props => props.theme.colors.backgroundSecondary}
    position: relative;
  }

  .degree-description {
    margin-bottom: 75px;
  }

  .topcurvemobile {
    grid-area: curve;
    display: block;
    position: absolute;
    z-index: -100;
    bottom: 0;
    left: 0;
    right: 0;
  
    svg {
      width: 100%;
      path {
        fill: ${props => props.theme.colors.backgroundSecondary};
      }
    }
  }

  .credit-info {
    padding: 1rem;
  
    .floating-box {
      padding: 1rem 1rem;
      background-color: ${props => props.theme.colors.backgroundPrimary}
      box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
      border-radius: 8px;
    }
  }
} 
`;

const loadingSpinnerOverride = css`
  margin: 4rem auto;
  grid-area: header;
`;

export default function CreditingInfo(props) {
  const {creditingData, isLoading} = props;
  const globalState = useGlobalStateContext();

  const degreeNqf = (creditingData && creditingData.academicdegree && globalState.nqfLevels 
    ? globalState.nqfLevels.find(level => level.id === creditingData.academicdegree.nqf) 
    : undefined);
  const competenceNqf = (creditingData && creditingData.competence && globalState.nqfLevels
    ? globalState.nqfLevels.find(level => level.id === creditingData.competence.nqf) 
    : undefined);


  const curveMobile = (color) =>
  <svg viewBox="0 0 320 272" version="1.1" xmlns="http://www.w3.org/2000/svg">
    <title>Top Curve Mobile</title>
    <g id="Visual" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <g id="Contact" fill="#6DE5B8">
            <path d="M320,278 L320,272 C281.333333,252 228,242 160,242 C92,242 38.6666667,252 0,272 L0,278 L0,0 L320,0 L320,278 Z" id="Combined-Shape"></path>
        </g>
    </g>
  </svg>

  return (
    <S.CreditingInfo>
      {isLoading &&  
        <BarLoader
          css={loadingSpinnerOverride}
          sizeUnit={"px"}
          size={150}
          loading={isLoading}
        />
      }
      {creditingData &&
        <>
          <div className='half-background' />
          <div className='header' >
            <p>
              <Link to="/">
                <i className="fas fa-arrow-left" />
                <FormattedMessage id="creditinginfo.back" />
              </Link>
            </p>
          </div>
          { creditingData.academicdegree 
            ? <>
              <div className='degree-info' >
                <h2>
                  {creditingData.academicdegree[`name_${globalState.language}`]
                    ? creditingData.academicdegree[`name_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </h2>
                <p className='scope'>
                  <FormattedMessage id="creditinginfo.scope" />: 
                  {' '}
                  {creditingData.academicdegree.credits 
                    ? `${creditingData.academicdegree.credits} op`
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
                <p className='level'>
                  <FormattedMessage id="creditinginfo.level" />:
                  {' '}
                  {degreeNqf
                    ? `${degreeNqf[`name_${globalState.language}`]} (NQF ${degreeNqf.level})`
                    : <FormattedMessage id='creditinginfo.notfound' />}
                  </p>
              </div>
              <div className='degree-description' >
                <h3><FormattedMessage id="creditinginfo.degreedescription" /></h3>
                <p>
                  {creditingData.academicdegree[`description_${globalState.language}`]
                    ? creditingData.academicdegree[`description_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
              </div>
              <div className='topcurvemobile'>
                  {curveMobile()}
              </div>
            </>
            : <div className='degree-info' >
              <h2>
                <FormattedMessage id='creditinginfo.notfound' />
              </h2>
            </div>
          }
          <div className='credit-info' >
            <div className='floating-box'>
              <p>
                  {creditingData[`description_${globalState.language}`]
                    ? creditingData[`description_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
              {creditingData.url &&
              <p className='readmore'>
                <a href={creditingData.url}>
                  <FormattedMessage id="creditinginfo.readmore" />
                </a>
              </p>
            }
            </div>
          </div>
          {creditingData.competence
            ? <>
              <div className='competence-info' >
                <h2>
                  {creditingData.competence[`name_${globalState.language}`]
                    ? creditingData.competence[`name_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </h2>
                <p className='scope'>
                  <FormattedMessage id="creditinginfo.scope" />: 
                  {' '}
                  {creditingData.competence.credits 
                    ? `${creditingData.competence.credits} op`
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
                <p className='level'>
                  <FormattedMessage id="creditinginfo.level" />:
                  {' '}
                  {competenceNqf
                    ? `${competenceNqf[`name_${globalState.language}`]} (NQF ${competenceNqf.level})`
                    : <FormattedMessage id='creditinginfo.notfound' />}
                  </p>
              </div>
              <div className='competence-description' >
                <h3><FormattedMessage id="creditinginfo.competencedescription" /></h3>
                <p>
                  {creditingData.competence[`description_${globalState.language}`]
                    ? creditingData.competence[`description_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
              </div>
            </>
            : <div className='competence-info' >
                <h2>
                  <FormattedMessage id='creditinginfo.notfound' />
                </h2>
              </div>
          }
          
          <div className='footer' >
            <Link to="/">
              <button>
                <FormattedMessage id="creditinginfo.back" />
              </button>
            </Link>
          </div>
        </>
      }
      {!isLoading && !creditingData && 
        <h1 className='error'><FormattedMessage id="creditinginfo.notfound" /></h1>
      }

    </S.CreditingInfo>
  );
}
