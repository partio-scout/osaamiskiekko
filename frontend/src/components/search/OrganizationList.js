import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import OrganizationItem from './OrganizationItem';

const S = {};
S.OrganizationList = styled.ul`
  max-width: 660px;
  margin: auto;
  margin-bottom: 50px;
  padding: 0px 20px 0px 20px;

h1 {
  padding: 34px 0px 34px 0px;
  margin: auto;
  word-break: break-word;
}
`;

const OrganizationList = (props) => {
  const { creditingInfoByOrganization } = props;
  const globalState = useGlobalStateContext();

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
