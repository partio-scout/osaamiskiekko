import React from 'react';
import styled from 'styled-components';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { FormattedMessage } from 'react-intl';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

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

.half-background {
  background-color: ${props => props.theme.colors.backgroundTertiary}
  position: absolute;
  top: 0;
  left: 50%;
  right: 0;
  bottom: 0;
}

.header {
  z-index: 10;
  grid-area: header;
}

.degree-info {
  padding-right: 5rem;
  grid-area: degree-info;
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

  button {
    margin: auto;
    display: block;
  }
}

.error {
  grid-area: header;
}
`;

const loadingSpinnerOverride = css`
  margin: 4rem auto;
  grid-area: header;
`;

export default function CreditingInfo(props) {
  const {creditingData, isLoading} = props;
  const globalState = useGlobalStateContext();
  
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
            <button><FormattedMessage id="creditinginfo.back" /></button>
          </div>
          <div className='degree-info' >
            <h2>{creditingData.academicdegree[`name_${globalState.language}`]}</h2>
            
          </div>
          <div className='competence-info' >
            <h2>{creditingData.competence[`name_${globalState.language}`]}</h2>
          </div>
          <div className='credit-info' >
            <div className='floating-box'>
              <p>{creditingData[`description_${globalState.language}`]}</p>
            </div>
          </div>
          <div className='degree-description' >
            <h2>DegreeDesc</h2>
            <p>{creditingData.academicdegree[`description_${globalState.language}`]}</p>
          </div>
          <div className='competence-description' >
            <h2>CompyDesc</h2>
            <p>{creditingData.competence[`description_${globalState.language}`]}</p>
          </div>
          <div className='footer' >
            <button>TODO TAKAISIN</button>
          </div>
        </>
      }
      {!isLoading && !creditingData && 
        <h1 className='error'><FormattedMessage id="creditinginfo.notfound" /></h1>
      }

    </S.CreditingInfo>
  );
}
