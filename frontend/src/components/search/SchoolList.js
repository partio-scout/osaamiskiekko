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

.accessible-text {
  position: absolute;
  left: -9999px;
}

.noresults {
  text-align: center;
}

@media only screen and (max-width: 400px) {
  margin-top: 70px;
}
`;

const Results = (props) => {
  const { sortedSchoolList, globalState } = props;
  let amountOfResults = sortedSchoolList.filter(school => school.creditingInfos.length > 0)
  if (amountOfResults.length > 0) {
    return (
      <div>
        {sortedSchoolList.map(school => school.creditingInfos.length > 0 &&
          <div key={school.id}>
            <h3>{school[`name_${globalState.language}`]} ({school.creditingInfos.length})</h3>
            {school.creditingInfos.map(info => <SchoolItem key={info.id} creditingInfo={info}/>)}
          </div>
        )}
      </div>
    );
  }
  return (
    <h3 className='noresults'>
      <FormattedMessage id='schoolResults.noresults'/>
    </h3>
  );
}

const SchoolList = (props) => {
  const { sortedSchoolList, currentCarouselField } = props;
  const globalState = useGlobalStateContext();

  return (
    <S.SchoolList className='school-list' id='school-list' aria-atomic={true}>
      <h2 className='accessible-text'>
        <FormattedMessage id="schoolResults.resultsForAccessiblePeople" values= {{
          degree: currentCarouselField[`name_${globalState.language}`]
        }} />
      </h2>
      <Results sortedSchoolList={sortedSchoolList} globalState={globalState}/>
    </S.SchoolList>
  );
}

export default SchoolList;
