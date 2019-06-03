import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';

const S = {};
S.CompetenceCreditingItem = styled.div`
  
`;

const StyledLink = styled(Link)`
  text-decoration: none;
`;

const CompetenceCreditingItem = (props) => {
  const creditingInfo = props.data;
  const globalState = useGlobalStateContext();
  return (
    <StyledLink to={`/ahot/${creditingInfo.id}`}>
      <S.CompetenceCreditingItem>
        <span className='name'>
          { creditingInfo.competence[`name_${globalState.language}`] }
        </span>
        <span>arrow</span>
      </S.CompetenceCreditingItem>
    </StyledLink>
  );
}

export default CompetenceCreditingItem;
