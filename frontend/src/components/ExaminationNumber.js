import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';

const S = {};
S.ExaminationNumber = styled.div`
  text-align: center;
  margin-top: 2em;
  .examination-number {
    padding: 5px;
  }

  .accessible-text {
    position: absolute;
    left: -9999px;
  }

  h2, h2 span {
    font-size: 18px;
    line-height: 27px;
    font-weight: normal;
  }

  @media only screen and (max-width: 767px) {
    h2, h2 span {
      font-size: 16px;
      line-height: 24px;
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
          <>
            <div className='accessible-text'>
              <FormattedMessage id="examination.notificationForAccessiblePeople"/>
            </div>
            <FormattedMessage id="examination.creditingInfoForCompetence" values= {{
              amount: creditingAmountForCompetence
              }} />
          </>
        }
      </h2> 
    </S.ExaminationNumber>
  );
}

export default ExaminationNumber;
