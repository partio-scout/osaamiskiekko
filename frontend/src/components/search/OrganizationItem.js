import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import CompetenceCreditingList from './CompetenceCreditingList';

const S = {};
S.OrganizationItem = styled.div`
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

const OrganizationItem = (props) => {
  const data = props.creditingInfoForOrganization;
  const globalState = useGlobalStateContext();
  
  return (
    <S.OrganizationItem>
        <div className="image-container">
          <img src={data.url} alt="" align="left"/>
        </div>
        <div className="text-container">
          <h2 className='name'>{data[`name_${globalState.language}`]}</h2>
        </div>
        <CompetenceCreditingList className='credit-list' data={data.creditingInfos} />
    </S.OrganizationItem>
  );
}

export default OrganizationItem;
