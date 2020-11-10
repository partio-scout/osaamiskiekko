import React, { useState } from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import CompetenceCreditingList from './CompetenceCreditingList';
import { getFullImageURL } from '../../api/ApiUtils';

const S = {};
S.OrganizationItem = styled.div`
.organization-item {
  position: relative;
  display: flex;
  align-items: center;
  border: none;
  padding: 0;
  background-color: ${props => props.theme.colors.highlight};
  color: ${props => props.theme.colors.textColorLight}; 
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  margin-bottom: 16px;
  transition: 0.2s;
  width: 100%;
  text-align: left;

  :hover, :focus {
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

  .name {
    background-color: ${props => props.theme.colors.highlight};
    color: ${props => props.theme.colors.textColorLight};
    flex: 1 1 auto;
    font-size: 18px;
    font-weight: bold;
    line-height: 26px;
    margin: 1em 0.1em 1em 79px
    overflow: hidden;
  }

  i {
    background-color: ${props => props.theme.colors.highlight};
    color: ${props => props.theme.colors.textColorLight};
    font-size: 22px;
    margin: 0 1em 0 0.5em;
    flex: 0 0 auto;
  }
}

.credit-list {
  display: none;
}
`;

const OrganizationItem = (props) => {
  const data = props.creditingInfoForOrganization;
  const globalState = useGlobalStateContext();
  const [showCreditingList, setShowCreditingList] = useState(false);

  const toggleCreditingList = () => setShowCreditingList(!showCreditingList);

  const logoUrl = `data/images/${data.logo}`;

  return (
    <S.OrganizationItem logoUrl={logoUrl}>
        <h3>
          <button
              className='organization-item'
              aria-expanded={showCreditingList}
              aria-controls={`crediting-list-${data.id}`}
              onClick={toggleCreditingList}>
            <div className='logo' />
            <h3 className='name'>{data[`name_${globalState.language}`]} ({data.creditingInfos && data.creditingInfos.length})</h3>
            {!showCreditingList && <i className="fas fa-chevron-down"></i>}
            {showCreditingList && <i className="fas fa-chevron-up"></i>}
          </button>
        </h3>
        {showCreditingList && <div className='crediting-list' id={`crediting-list-${data.id}`}>
          <CompetenceCreditingList data={data.creditingInfos} />
        </div>}
    </S.OrganizationItem>
  );
}

export default OrganizationItem;
