import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';

const S = {};
S.ExaminationNumber = styled.div`
  text-align: center;
  margin: 2em;
  position: relative;
  z-index: 10;
  .examination-number {
    padding: 5px;
  }

  h2, h2 span {
    font-size: 18px;
    line-height: 1.5;
    font-weight: normal;
  }

  @media only screen and (max-width: 767px) {
    h2, h2 span {
      font-size: 16px;
      line-height: 1.5;
    }
  }
`;


const ExaminationNumber = (props) => {
  const { creditingAmountForDegree, creditingAmountForCompetence } = props;

  return (
    <S.ExaminationNumber>
      <h2 className="results-amount">
        { creditingAmountForDegree &&
          <FormattedMessage id="examination.creditingInfoForDegree" values= {{
            amount: creditingAmountForDegree
          }} />
        }
        { creditingAmountForCompetence &&
          <FormattedMessage id="examination.creditingInfoForCompetence" values= {{
            amount: creditingAmountForCompetence
            }} />
        }
      </h2> 
    </S.ExaminationNumber>
  );
}

export default ExaminationNumber;
