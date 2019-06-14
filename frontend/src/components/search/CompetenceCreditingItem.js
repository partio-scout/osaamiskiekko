import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';

const S = {};
S.CompetenceCreditingItem = styled.div`
.crediting-item {
  position: relative;
  display: flex;
  align-items: center;
  border: none;
  padding: 0;
  background-color: ${props => props.theme.colors.backgroundPrimary};
  color: ${props => props.theme.colors.textColor}; 
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  margin-bottom: 16px;
  width: 100%;
  text-align: left;


  .name {
    background-color: ${props => props.theme.colors.backgroundPrimary};
    color: ${props => props.theme.colors.textColor};
    flex: 1 1 auto;
    font-size: 18px;
    font-weight: bold;
    line-height: 26px;
    margin: 1em 0.1em 1em 1em;
    overflow: hidden;
  }

  i {
    background-color: ${props => props.theme.colors.backgroundPrimary};
    color: ${props => props.theme.colors.textColor};
    font-size: 22px;
    margin: 0 1em 0 0.5em;
    flex: 0 0 auto;
  }
}
`;

const StyledLink = styled(Link)`
  text-decoration: none;
  transition: 0.2s;
  display: block;

  :hover, :focus {
    transition: 0.2s;
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.3);
    cursor: pointer;
  }
`;

const CompetenceCreditingItem = (props) => {
  const creditingInfo = props.data;
  const globalState = useGlobalStateContext();
  return (
    <StyledLink to={`/ahot/${creditingInfo.id}`}>
      <S.CompetenceCreditingItem>
        <div className='crediting-item'>
          <span className='name'>
            { creditingInfo.competence[`name_${globalState.language}`] }
          </span>
          <i className="fas fa-arrow-right"></i>
        </div>
      </S.CompetenceCreditingItem>
    </StyledLink>
  );
}

export default CompetenceCreditingItem;
