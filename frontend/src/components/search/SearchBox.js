import React, { useState, useEffect }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import OutsideClickHandler from 'react-outside-click-handler';

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
  width: 587px;
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

  const {selectedInstitution, selectedTraining} = globalState;

  const [institutionInput, setInstitutionInput] = useState('');
  const [institutionFilter, setInstitutionFilter] = useState([]);
  const [institutionSelection, setInstitutionSelection] = useState(null);
  const [trainingInput, setTrainingInput] = useState('');
  const [trainingFilter, setTrainingFilter] = useState([]);

  const updateInputsWithInstitution = (institution) => {
    setInstitutionSelection(institution);
    setInstitutionInput(institution[`name_${globalState.language}`]);
    setInstitutionFilter([]);
    setTrainingFilter([]);
    setTrainingInput('');
    clearResults();
  }

  const updateInputsWithTraining = (training) => {
    setTrainingInput(training[`name_${globalState.language}`]);
    setTrainingFilter([]);
  }
  
  useEffect(() => {
    if (selectedInstitution && selectedTraining) {
      updateInputsWithInstitution(selectedInstitution);
      updateInputsWithTraining(selectedTraining);
      showResults(selectedInstitution, selectedTraining);
    }
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const noResults = {
    id: 1,
    error: true,
    name_fi: 'Tuloksia ei löytynyt',
    name_en: 'No search results',
    name_sv: "Inga resultat hittades"
  };

  const searchComparison = (item, searchValue) => 
    item.name_en.toUpperCase().includes(searchValue.toUpperCase()) ||
    item.name_fi.toUpperCase().includes(searchValue.toUpperCase()) ||
    item.name_sv.toUpperCase().includes(searchValue.toUpperCase());

  const showPreResults = (e) => {
    if (e === 'search-school') setInstitutionFilter(data);
    if (e === 'search-education') {
      if (institutionSelection.type_en === 'School') {
        setDegreeOrCompetenceResults(institutionSelection.academicdegrees);
      } else {
        setDegreeOrCompetenceResults(institutionSelection.competences);
      }
    }
  };

  const filterSchoolOrOrganization = (searchValue) => {
    setInstitutionInput(searchValue);
    if (searchValue) {
      setInstitutionSelection(null);
      const results = data.filter(item => searchComparison(item, searchValue));
      results.length > 0 ?
      setInstitutionFilter (results) :
      setInstitutionFilter([noResults]);
      setTrainingInput('');
    } else {
      setInstitutionFilter([]);
      setTrainingFilter([]);
      setTrainingInput('');
      setInstitutionSelection(null);
    }
  }

  const setDegreeOrCompetenceResults = (results) =>
    results.length > 0 ?
    setTrainingFilter(results) :
    setTrainingFilter([noResults]);

  const filterDegreesOrCompetences = (searchValue) => {
    setTrainingInput(searchValue);
    if (searchValue) {
      if (institutionSelection.type_en === 'School') {
        const results = institutionSelection.academicdegrees
          .filter(item => searchComparison(item, searchValue));
        setDegreeOrCompetenceResults(results);
      } else {
        const results = institutionSelection.competences
          .filter(item => searchComparison(item, searchValue));
        setDegreeOrCompetenceResults(results);
      }
    } else {
      setTrainingFilter([]);
    }
  }
  
  const userInstitutionSelection = (selection) => {
    if (selection.error) return;

    globalState.selectedInstitution = selection;
    updateInputsWithInstitution(selection);
  };

  const userTrainingSelection = (selection) => {
    if (selection.error) return;

    globalState.selectedTraining = selection;
    updateInputsWithTraining(selection);
    showResults(institutionSelection, selection);
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
      {!isLoading &&
        <div className="search-wrapper">
          <OutsideClickHandler
            onOutsideClick={() => {
              setInstitutionFilter([]);
            }}
          >
          <SearchInput 
            handleInput={filterSchoolOrOrganization} 
            inputValue={institutionInput} 
            labelKey='search.label' 
            name='search-school'
            className='search-school'
            results={institutionFilter}
            setSelection={userInstitutionSelection}
            showPreResults={showPreResults}
            />
          </OutsideClickHandler>
            {institutionSelection &&
              <OutsideClickHandler
                onOutsideClick={() => {
                  setTrainingFilter([]);
                }}
              >
            <SearchInput
              handleInput={filterDegreesOrCompetences}
              inputValue={trainingInput} 
              labelKey='search.labelSecondary'
              name='search-education' 
              className='search-education'
              results={trainingFilter}
              setSelection={userTrainingSelection}
              showPreResults={showPreResults}
            />
          </OutsideClickHandler>
            }
        </div>
      }
    </S.SearchBox>
  )
}
