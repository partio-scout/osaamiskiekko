import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import CompetenceCreditingItem from './CompetenceCreditingItem';

const S = {};
S.CompetenceCreditingList = styled.ul`
  max-width: 660px;
  margin: auto;
  margin-bottom: 50px;
  padding: 0px 20px 0px 20px;
`;

const CompetenceCreditingList = (props) => {
  const creditingInfos = props.data;
  const globalState = useGlobalStateContext();

  return (
    <S.CompetenceCreditingList>
      { creditingInfos.map(creditingInfo => (
        <li key={creditingInfo.id} className='credit-item'>
          <CompetenceCreditingItem data={creditingInfo} />
        </li>
      ))}
    </S.CompetenceCreditingList>
  );
}

export default CompetenceCreditingList;
