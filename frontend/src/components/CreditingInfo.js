import React from 'react';
import styled from 'styled-components';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { FormattedMessage } from 'react-intl';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { Link } from 'react-router-dom';
import Button from './atoms/Button';
import translations from '../translations/translations';

const S = {};
S.CreditingInfo = styled.div`
display: grid;
grid-template-areas: 
  "header header"
  "credit-info credit-info"
  "degree-info competence-info" 
  "footer footer";
grid-template-columns: 4fr 4fr;
// padding: 2rem;
// margin-bottom: 1rem;
// box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
// border-radius: 8px;
// background-color: ${props => props.theme.colors.backgroundPrimary};
position: relative;
z-index: 8;

p, p span {
  margin: 5px 0;
  font-size: 18px;
  line-height: 27px;
  white-space: pre-wrap;
}

.link-and-share {
  display: none;
}

.header {
  z-index: 10;
  grid-area: header;
  margin-bottom: 1rem;

  i {
    font-size: 30px;
    margin-right: 1rem;
  }

  i, span {
    vertical-align: middle;
  }

  i, a {
    color: ${props => props.theme.colors.textColor};
    text-decoration: none;
  }
}

.degree-info, .competence-info {
  font-size: 16px;
  line-height: 1;

  h2, h2 span {
    display: inline;
    margin: 5px 0;
    font-size: 26px;
    line-height: 28px;
    font-weight: bold;
    background-size: 100% 0.5rem;
    background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.textHighlight} 0)`};
    background-repeat: no-repeat;
    background-position-y: 100%;
  }

  h3, h3 span {
    margin: 20px 0 10px 0;
    font-size: 20px;
    line-height: 30px;
    font-weight: bold;
  }

  p, p span {
    font-size: 18px;
    line-height: 27px;
  }

  p.level, p.level span, p.scope, p.scope span {
    margin: 0.5rem 0;
    font-size: 16px;
    line-height: 15px;
  }

  span:first-child {
    font-weight: bold;
  }
}

.floating-box {
  padding: 1rem 2rem;
  background-color: ${props => props.theme.colors.backgroundPrimary};
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
}

.credit-info {
  grid-area: credit-info;
  margin-top: -30px;
  margin-bottom: 1.5rem;
  z-index: 10;

  h2, h2 span {
    margin: 10px 0;
    font-size: 26px;
    line-height: 28px;
    font-weight: bold;
  }

  p.readmore {
    margin-top: 1rem;
    text-align: left;
  }
}

.degree-info {
  grid-area: degree-info;
  margin-right: 14px;
}

.competence-info {
  grid-area: competence-info;
  margin-left: 14px;
}

.footer {
  grid-area: footer;
  z-index: 10;
  display: flex;
  flex-direction: column;
  align-items: center;

  button {
    margin-top: 2rem;
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
    "credit-info"
    "degree-info"
    "curve"
    "competence-info" 
    "footer";
  padding: 0;
  border: none;
  box-shadow: none;
  background: none;

  h1, h1 span {
    margin-bottom: 0;
  }

  p, p span {
    margin: 5px 0;
    font-size: 16px;
    line-height: 24px;
  }

  .link-and-share {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .header, .footer, .credit-info, .degree-info, .competence-info {
    padding: 1rem;
    margin: 0;
    background: none;

    h2, h2 span {
      margin: 5px 0;
      font-size: 20px;
      line-height: 28px;
      background: none;
    }

    p, p span {
      font-size: 16px;
      line-height: 24px;
    }
  }

  .degree-info, .credit-info, .header {
    background: ${props => props.theme.colors.themeGradient}
  }

  .degree-info {
    padding-bottom: 0;
  }

  .credit-info {
    padding: 0rem 0.5rem;
    margin: 0;

    p.readmore {
      text-align: center;
    }
  }

  .degree-info, .competence-info {
    border-radius: 0;
    box-shadow: none;

    p.level, p.level span, p.scope, p.scope span {
      font-size: 14px;
      line-height: 15px;
    }
  }

  .topcurvemobile {
    grid-area: curve;
    display: block;
    position: absolute;
    z-index: -100;
    bottom: -75px;
    left: 0;
    right: 0;
  
    svg {
      width: 100%;
    }
  }

  .competence-info {
    margin-top: 75px;
    background-color: ${props => props.theme.colors.backgroundPrimary}
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

  const curveMobile = (color) => (
    <svg viewBox="0 0 320 272" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="gradient">
          <stop
            offset="0%"
            style={{
              'stopOpacity': '1'
            }}
          />
          <stop
            offset="100%"
            style={{
              'stopOpacity': '1'
            }}
          />
        </linearGradient>
      </defs>
      <title>Top Curve Mobile</title>
      <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
          <g id="Contact" fill="url(#gradient)">
              <path d="M320,278 L320,272 C281.333333,252 228,242 160,242 C92,242 38.6666667,252 0,272 L0,278 L0,0 L320,0 L320,278 Z" id="Combined-Shape"></path>
          </g>
      </g>
    </svg>);

  const school = (creditingData && creditingData.academicdegree && creditingData.academicdegree.school);
  const degreeNqf = (creditingData && creditingData.academicdegree && creditingData.academicdegree.nqf);
  const organization = (creditingData && creditingData.competence && creditingData.competence.organization);
  const competenceNqf = (creditingData && creditingData.competence && creditingData.competence.nqf);

  const testForChromeOrSafariAndMobileForWebShare = () => {
    if (navigator.userAgent.search("Safari") >= 0 || navigator.userAgent.search("Chrome") >= 0) {
      if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        return true;
      }
    }
  }

  const shareMessages = {
    en: translations.en["shareMessage"],
    fi: translations.fi["shareMessage"],
    sv: translations.sv["shareMessage"]
  }

  const shareText = {
    en: translations.en["shareButton"],
    fi: translations.fi["shareButton"],
    sv: translations.sv["shareButton"],
  }

  const mobileShareOnClickHandler = () => {
    navigator.share({
      title: shareMessages[globalState.language],
      text: shareMessages[globalState.language],
      url: window.location.href
    }).then(() => console.log('Successful share'))
      .catch(error => console.log('Error sharing:', error));
  }

  return (
    <S.CreditingInfo aria-live='polite' aria-busy={isLoading} aria-atomic={true} >
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
          <div className='header' >
            <div className='link-and-share'>
              <Link to="/" aria-live='off'>
                <i className="fas fa-arrow-left" />
                <FormattedMessage id="creditinginfo.back" />
              </Link>
            </div>
          </div>
          <div className='credit-info' >
            <div className='floating-box'>
              <h2>
                <FormattedMessage id='creditinginfo.crediting' />
              </h2>
              <p>
                  {creditingData[`description_${globalState.language}`]
                    ? creditingData[`description_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </p>
              {testForChromeOrSafariAndMobileForWebShare() &&
                <Button
                  value={shareText[globalState.language]}
                  icon='fas fa-share-alt'
                  onClick={mobileShareOnClickHandler}
                />
              }
              {creditingData.url &&
              <p className='readmore'>
                <a href={creditingData.url} target="_blank" rel="noopener noreferrer">
                  <FormattedMessage id="creditinginfo.readmore" />
                </a>
              </p>
            }
            </div>
          </div>
          <div className='degree-info floating-box' >
          { creditingData.academicdegree
            ? <>
              <h2>
                <span>
                  {creditingData.academicdegree[`name_${globalState.language}`]
                    ? creditingData.academicdegree[`name_${globalState.language}`]
                    : <FormattedMessage id='creditinginfo.notfound' />}
                </span>
              </h2>
              <p className='institution'>
                {school && school[`name_${globalState.language}`]}
              </p>
              <p className='scope'>
                <FormattedMessage id="creditinginfo.scope" />:
                {' '}
                {creditingData.academicdegree.credits
                  ? `${creditingData.academicdegree.credits} op/osp`
                  : <FormattedMessage id='creditinginfo.notfound' />}
              </p>
              <p className='level'>
                <FormattedMessage id="creditinginfo.level" />:
                {' '}
                {degreeNqf
                  ? `${degreeNqf[`name_${globalState.language}`]} (NQF ${degreeNqf.level})`
                  : <FormattedMessage id='creditinginfo.notfound' />}
              </p>
              <h3><FormattedMessage id="creditinginfo.degreedescription" /></h3>
              <p>
                {creditingData.academicdegree[`description_${globalState.language}`]
                  ? creditingData.academicdegree[`description_${globalState.language}`]
                  : <FormattedMessage id='creditinginfo.notfound' />}
              </p>
            </>
            : <h2>
                <FormattedMessage id='creditinginfo.notfound' />
              </h2>
          }
          </div>
          <div className='topcurvemobile'>
            {curveMobile()}
          </div>
          <div className='competence-info floating-box' >
            {creditingData.competence
              ? <>
                  <h2>
                    <span>
                      {creditingData.competence[`name_${globalState.language}`]
                        ? creditingData.competence[`name_${globalState.language}`]
                        : <FormattedMessage id='creditinginfo.notfound' />}
                    </span>
                  </h2>
                  <p className='institution'>
                    {organization && organization[`name_${globalState.language}`]}
                  </p>
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
                  <h3><FormattedMessage id="creditinginfo.competencedescription" /></h3>
                  <p>
                    {creditingData.competence[`description_${globalState.language}`]
                      ? creditingData.competence[`description_${globalState.language}`]
                      : <FormattedMessage id='creditinginfo.notfound' />}
                  </p>
                </>
              : <h2>
                  <FormattedMessage id='creditinginfo.notfound' />
                </h2>
            }
          </div>
          <div className='footer' >
            <Link to="/" tabIndex={-1}>
              <FormattedMessage id="creditinginfo.back">
              {msg =>
                <Button value={msg} />
              }
              </FormattedMessage>
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
