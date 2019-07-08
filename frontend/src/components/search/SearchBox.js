import React, { useState, useEffect }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import translations from '../../translations/translations';

const S = {};
S.SearchBox = styled.div`
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  margin-top: -500px;
  z-index: 20;
  position: relative;
  margin-left: auto;
  margin-right: auto;
  width: 733px;
  display: flex;
  justify-content: center;
  align-items: start;
  padding: 32px 73px;

  .search-wrapper {
    width: 100%;

    > div {
      margin-top: 2.5em;

      &:first-child {
        margin-top: 0;
      }
    }
  }

  @media only screen and (max-width: 767px) {
    width: 85%;
    padding: 16px;
  }
`;

const loadingSpinnerOverride = css`
    margin: auto;
    margin-top: 60px;
`;

export default function SearchBox(props) {
  const { showResults, data, isLoading, clearResults } = props;
  const globalState = useGlobalStateContext();

  const [secondData, setSecondData] = useState([]);

  // When changing language, globalState loses the selected institution and will be undefined.
  // If we set it as null, the dropdown knows we want to render empty input.
  // TODO investigate why globalState lose the selected institution when changing language.
  if (globalState.selectedInstitution === undefined) {
    globalState.selectedInstitution = null;
    clearResults();
  }

  useEffect(() => {
    if (globalState.selectedInstitution && globalState.selectedTraining) {
      const tempSelectedTraining = globalState.selectedTraining;
      handleInstitutionSelection(globalState.selectedInstitution);
      globalState.selectedTraining = tempSelectedTraining;
      showResults(globalState.selectedInstitution, globalState.selectedTraining);
    }
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const handleInstitutionSelection = (selection) => {
    if (!selection) return;
    
    globalState.selectedTraining = null;
    globalState.selectedInstitution = selection;
    clearResults();
    if (selection.type_en === translations.en["institution.type.school"]) {
      setSecondData(selection.academicdegrees || []);
    } else {
      setSecondData(selection.competences || []);
    }
  };

  const handleTrainingSelection = (selection) => {
    if (!selection) return;

    globalState.selectedTraining = selection;
    showResults(globalState.selectedInstitution, selection);
  }

  return (
    <S.SearchBox id="search-box">
      {isLoading &&  
      <BarLoader
        css={loadingSpinnerOverride}
        sizeUnit={"px"}
        size={150}
        color={'#00283B'}
        loading={isLoading}
      />}
      {!isLoading && data &&
        <div className="search-wrapper">
          <SearchInput
            options={data}
            value={globalState.selectedInstitution}
            setSelection={handleInstitutionSelection}
            labelKey='search.label' 
            name='search-school'
            className='search-school'
            />
          {globalState.selectedInstitution && 
            <SearchInput
              options={secondData}
              value={globalState.selectedTraining}
              setSelection={handleTrainingSelection}
              labelKey='search.labelSecondary'
              name='search-education'
              className='search-education'
            />
          }
        </div>
      }
    </S.SearchBox>
  )
}
