import React, { useState, useContext }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import SearchResults from './SearchResults';
import { GlobalState } from '../App';

const S = {};
S.SearchBox = styled.div`
  background-color: white;
  min-height: 190px;	
  width: 587px;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  position: relative;
  padding: 34px;
  margin: auto;

  div {
    display: flex;
    flex-direction: column;
  }

  button {
    height: 45px;
    width: 220px;
    background-color: #7FD1AE;
    padding: 24px;
    margin: auto;
    line-height: 0;
    margin-top: 25px;
    font-size: 16px;	
    letter-spacing: 4px;	
    line-height: 0px;	
    text-align: center;
    :hover {
      cursor: pointer;
      outline: none;
    }
  }

  @media only screen and (max-width: 945px) {
    margin-top: 0px;
  }

  @media only screen and (max-width: 800px) {
    width: 350px;
    margin-top: -20px;
  }
`;

const loadingSpinnerOverride = css`
    margin: auto;
    margin-top: 80px;
`;

export default function SearchBox(props) {
  const { showResults } = props;
  const [globalState] = useContext(GlobalState);
  const { data, isLoading } = getSchoolsAndOrganizations();

  const [inputSchoolOrOrganization, setinputSchoolOrOrganization] = useState('');
  const [schoolOrOrganizationFilter, setschoolOrOrganizationFilter] = useState([]);
  const [schoolOrOrganizationSelection, setschoolOrOrganizationSelection] = useState(null);

  const [inputTrainingValue, setinputTrainingValue] = useState('');
  const [competenceOrDegreeFilter, setcompetenceOrDegreeFilter] = useState([]);
  const [competenceOrDegreeSelection, setcompetenceOrDegreeSelection] = useState(null);

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

  const filterSchoolOrOrganization = (searchValue) => {
    setinputSchoolOrOrganization(searchValue);
    if (searchValue) {
      const results = data.filter(item => searchComparison(item, searchValue));
      results.length > 0 ?
      setschoolOrOrganizationFilter (results) :
      setschoolOrOrganizationFilter([noResults]);
    } else {
      setschoolOrOrganizationFilter([]);
      setcompetenceOrDegreeFilter([]);
      setinputTrainingValue('');
    }
  }

  const setDegreeOrCompetenceResults = (results) =>
    results.length > 0 ?
    setcompetenceOrDegreeFilter(results) :
    setcompetenceOrDegreeFilter([noResults]);

  const filterDegreesOrCompetences = (searchValue) => {
    setinputTrainingValue(searchValue);
    if (searchValue) {
      if (schoolOrOrganizationSelection.type_en === 'School') {
        const results = schoolOrOrganizationSelection.academicdegrees
          .filter(item => searchComparison(item, searchValue));
        setDegreeOrCompetenceResults(results);
      } else {
        const results = schoolOrOrganizationSelection.competences
          .filter(item => searchComparison(item, searchValue));
        setDegreeOrCompetenceResults(results);
      }
    } else {
      setcompetenceOrDegreeFilter([]);
    }
  }

  const getUserSelectionForSchoolOrAcademy = (selection) => {
    if (selection.error) return;
    setschoolOrOrganizationSelection(selection);
    setinputSchoolOrOrganization(selection[`name_${globalState.language}`]);
    setschoolOrOrganizationFilter([]);
  };

  const getUserSelectionForDegreeOrCompetence = (selection) => {
    if (selection.error) return;
    setcompetenceOrDegreeSelection(selection);
    setinputTrainingValue(selection[`name_${globalState.language}`]);
    setcompetenceOrDegreeFilter([]);
  }

  return (
    <S.SearchBox>
      {isLoading &&  
      <BarLoader
        css={loadingSpinnerOverride}
        sizeUnit={"px"}
        size={150}
        color={'#00283B'}
        loading={isLoading}
      />}
      {!isLoading &&
        <div>
          <SearchInput {...{ handleInput: filterSchoolOrOrganization, inputValue: inputSchoolOrOrganization, label: 'searchbox.label' }}/>
          {schoolOrOrganizationFilter.length > 0 &&
          <SearchResults {...{ results: schoolOrOrganizationFilter, setSelection: getUserSelectionForSchoolOrAcademy, globalState }}/>
          }
          {schoolOrOrganizationSelection && inputSchoolOrOrganization &&
          <SearchInput {...{ handleInput: filterDegreesOrCompetences, inputValue: inputTrainingValue, label: 'searchbox.labelSecondary' }} />
          }
          <SearchResults {...{ results: competenceOrDegreeFilter, setSelection: getUserSelectionForDegreeOrCompetence, globalState }}/>
          <button onClick={() => showResults(schoolOrOrganizationSelection, competenceOrDegreeSelection)}>Näytä tulokset</button>
        </div>
      }
    </S.SearchBox>
  )
}
