import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';

const S = {};
S.ExaminationNumber = styled.div`
  text-align: center;
  .examination-number {
    padding: 5px;
  }
`;


const ExaminationNumber = (props) => {
  const { creditingAmountForDegree, creditingAmountForCompetence } = props;

  return (
      <S.ExaminationNumber>
        <p className="results-amount">
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
        </p> 
      </S.ExaminationNumber>
  );
}

export default ExaminationNumber;
