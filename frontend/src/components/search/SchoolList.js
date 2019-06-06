import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import SchoolItem from './SchoolItem';

const S = {};
S.SchoolList = styled.div`
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

const SchoolList = (props) => {
  const { sortedSchoolList } = props;
  const globalState = useGlobalStateContext();

  return (
    <S.SchoolList className='school-list'>
      {sortedSchoolList.map(school => school.creditingInfos.length > 0 &&
        <div key={school.id}>
        <h2>{school[`name_${globalState.language}`]} ({school.creditingInfos.length})</h2>
          {school.creditingInfos.map(info => <SchoolItem key={info.id} creditingInfo={info}/>)}
        </div>
        )}
    </S.SchoolList>
  );
}

export default SchoolList;
