import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import SchoolItem from './SchoolItem';

const S = {};
S.ListSchools = styled.div`
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

const ListSchools = (props) => {
  const { sortedSchoolList } = props;
  const globalState = useGlobalStateContext();

  return (
    <S.ListSchools>
      {sortedSchoolList.map(school => school.degree.length > 0 &&
        <div key={school.id}>
        <h2>{school[`name_${globalState.language}`]} ({school.degree.length})</h2>
          {school.degree.map(degree => <SchoolItem key={degree.id} degree={degree}/>)}
        </div>
        )}
    </S.ListSchools>
  );
}

export default ListSchools;
