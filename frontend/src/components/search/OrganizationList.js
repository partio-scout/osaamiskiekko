import React from 'react';
import styled from 'styled-components';
import OrganizationItem from './OrganizationItem';

const S = {};
S.OrganizationList = styled.ul`
  list-style: none;
  max-width: 660px;
  margin: auto;
  margin-bottom: 50px;
  padding: 0px 20px 0px 20px;
`;

const OrganizationList = (props) => {
  const { creditingInfoByOrganization } = props;

  return (
    <S.OrganizationList>
      { creditingInfoByOrganization.map(org => (
        <li key={org.id} className='organization'>
          <OrganizationItem creditingInfoForOrganization={org} />
        </li>
      ))}
    </S.OrganizationList>
  );
}

export default OrganizationList;
