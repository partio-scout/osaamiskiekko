import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import SchoolItem from './SchoolItem';

const S = {};
S.ListSchools = styled.div`

h1 {
  text-align: center;
}
`;

const ListSchools = (props) => {
  const { sortedSchoolList } = props;
  const globalState = useGlobalStateContext();

  return (
    <S.ListSchools>
      {sortedSchoolList.map(school => school.degree.length > 0 &&
        <div key={school.id}>
        <h1>{school[`name_${globalState.language}`]} ({school.degree.length})</h1>
          {school.degree.map(degree => <SchoolItem key={degree.id} degree={degree}/>)}
        </div>
        )}
    </S.ListSchools>
  );
}

export default ListSchools;
