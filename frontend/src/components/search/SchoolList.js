import React from 'react';
import { FormattedMessage } from 'react-intl';
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import SchoolItem from './SchoolItem';

const S = {};
S.SchoolList = styled.div`
  max-width: 660px;
  margin: auto;
  margin-bottom: 50px;
  padding: 0px 20px 0px 20px;
  margin-top: 50px;

h1 {
  padding: 34px 0px 34px 0px;
  margin: auto;
  word-break: break-word;
}

.noresults {
  line-height: 50px;
  text-align: center;
}

@media only screen and (max-width: 400px) {
  margin-top: 70px;
}
`;

const SchoolList = (props) => {
  const { sortedSchoolList } = props;
  const globalState = useGlobalStateContext();
  let amountOfResults = sortedSchoolList.filter(school => school.creditingInfos.length > 0)
  if (amountOfResults.length > 0) {
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
  return (
    <S.SchoolList className='school-list'>
      <h3 className='noresults'>
        <FormattedMessage id='noresults'/>
      </h3>
    </S.SchoolList>
  );
}

export default SchoolList;
