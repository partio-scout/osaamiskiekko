import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';

const S = {};
S.SchoolItem = styled.div`
  display: flex;
  align-items: center;
  background-color: white;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 0;
  margin-bottom: 16px;
  transition: 0.2s;
  text-decoration: none;
  position: relative;

  :hover {
    transition: 0.2s;
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.5);
    cursor: pointer;
  }

  .logo {
    position: absolute;
    flex: 0 0 auto;
    width: 69px;
    height: 100%;
    overflow: hidden;
    background: url('${props => props.logoUrl}') no-repeat center;
    background-size: cover;
    border-radius: 8px 0 0 8px;
  }

  .text-container {
    flex: 1 1 auto;
    margin: 1em 0.1em 1em 79px;
    overflow: hidden;

    p:first-child {
      font-size: 18px;
      font-weight: bold;
      line-height: 26px;
      margin: 0px;
      color: ${props => props.theme.colors.link};
    }
    p {
      margin: 0px;
      color: ${props => props.theme.colors.link};
    }
  }
`;

const StyledLink = styled(Link)`
  text-decoration: none;
`;

const SchoolItem = (props) => {
  const { creditingInfo } = props;
  const globalState = useGlobalStateContext();

  const school = creditingInfo.academicdegree.school;
  const logoUrl = `data/images/${school.logo}`;

  return (
    <StyledLink to={`/ahot/${creditingInfo.id}`}>
      <S.SchoolItem className='school-item' name={`school-item-${creditingInfo.id}`} logoUrl={logoUrl}>
          <div className='logo' />
          <div className="text-container">
            <p>{creditingInfo.academicdegree[`name_${globalState.language}`]}</p>
            <p>{creditingInfo.academicdegree.school[`name_${globalState.language}`]}</p>
          </div>
      </S.SchoolItem>
    </StyledLink>
  );
}

export default SchoolItem;
