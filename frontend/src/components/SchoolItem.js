import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.SchoolItem = styled.div`
  display: flex;
  align-items: center;
  background-color: white;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 34px;
  margin-bottom: 16px;
  max-height: 25px;
  transition: 0.2s;
  text-decoration: none;
  :hover {
    transition: 0.2s;
    transform: scale(1.05);
    cursor: pointer;
  }

  h2 {
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

  .image-container {
    margin-right: 20px;
    img {
      max-width: 55px;
    }
  }
`;

const StyledLink = styled(Link)`
  text-decoration: none;
`;

const SchoolItem = (props) => {
  const { degree } = props;
  const globalState = useGlobalStateContext();
  return (
    <StyledLink to={`/ahot/${degree.academicdegree.id}`}>
    <S.SchoolItem>
        <div className="image-container">
          <img src="http://placekitten.com/200/200" alt="katti" align="left"/>
        </div>
        <div className="text-container">
          <h2>{degree.academicdegree[`name_${globalState.language}`]}</h2>
          <p>Oppilaitos</p>
        </div>
    </S.SchoolItem>
    </StyledLink>
  );
}

export default SchoolItem;
