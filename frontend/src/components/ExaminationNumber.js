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
  const { creditingInfoForDegree } = props;

  return (
      <S.ExaminationNumber>
        <p className="results-amount">
          <FormattedMessage id="examination.info" />
             <span className="examination-number">{creditingInfoForDegree.length}</span>
          <FormattedMessage id="examination.infoEnd" />
          :
        </p> 
      </S.ExaminationNumber>
  );
}

export default ExaminationNumber;
