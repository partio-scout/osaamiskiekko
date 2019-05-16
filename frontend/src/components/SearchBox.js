import React, { useState, useContext }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import SearchResults from './SearchResults';
import GlobalStateContext from '../utils/GlobalStateContext';

const S = {};
S.SearchBox = styled.div`
  background-color: white;
  height: 250px;	
  width: 587px;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 34px;
  display: flex;
  flex-direction: column;
  margin: auto;
  margin-top: 50px;
  justify-content: center;

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
    margin: 0 auto;
`;

export default function SearchBox() {
  const globalState = useContext(GlobalStateContext);
  const { data, isLoading } = getSchoolsAndOrganizations();

  const [inputSchoolOrOrganization, setinputSchoolOrOrganization] = useState("");
  const [schoolOrOrganizationFilter, setschoolOrOrganizationFilter] = useState([]);
  const [schoolOrOrganizationSelection, setschoolOrOrganizationSelection] = useState(null);

  const [inputTrainingValue, setinputTrainingValue] = useState("");
  const [competenceOrDegreeFilter, setcompetenceOrDegreeFilter] = useState([]);
  const [competenceOrDegreeSelection, setcompetenceOrDegreeSelection] = useState(null);

  const filterSchoolOrOrganization = (searchValue) => {
    setinputSchoolOrOrganization(searchValue);
    if (searchValue) {
      const results = data.filter(item => 
        item.name_en.toUpperCase().includes(searchValue.toUpperCase()) ||
        item.name_fi.toUpperCase().includes(searchValue.toUpperCase()) ||
        item.name_sv.toUpperCase().includes(searchValue.toUpperCase())
        );
        if (results.length > 0) {
          setschoolOrOrganizationFilter (results);
        } else {
          setschoolOrOrganizationFilter([{
            id: 1,
            name_fi: 'Tuloksia ei löytynyt',
            name_en: 'No search results',
            name_sv: "Inga resultat hittades"
          }]);
        }
    } else {
      setschoolOrOrganizationFilter([]);
    }
  }

  const filterDegreesOrCompetences = (searchValue) => {
    setinputTrainingValue(searchValue);
    if (searchValue) {
      if (schoolOrOrganizationSelection.type_en === 'School') {
        const results = schoolOrOrganizationSelection.academicdegrees.filter(item =>
          item.name_en.toUpperCase().includes(searchValue.toUpperCase()) ||
          item.name_fi.toUpperCase().includes(searchValue.toUpperCase()) ||
          item.name_sv.toUpperCase().includes(searchValue.toUpperCase())
        );
        setcompetenceOrDegreeFilter(results)
      } else {
        const results = schoolOrOrganizationSelection.competences.filter(item =>
          item.name_en.toUpperCase().includes(searchValue.toUpperCase()) ||
          item.name_fi.toUpperCase().includes(searchValue.toUpperCase()) ||
          item.name_sv.toUpperCase().includes(searchValue.toUpperCase())
        );
        setcompetenceOrDegreeFilter(results)
      }
    } else {
      setcompetenceOrDegreeFilter([]);
    }
  }

  const getUserSelectionForSchoolOrAcademy = (selection) => {
    setschoolOrOrganizationSelection(selection);
    setinputSchoolOrOrganization(selection[`name_${globalState.language}`]);
    setschoolOrOrganizationFilter([]);
  };

  const getUserSelectionForDegreeOrCompetence = (selection) => {
    setcompetenceOrDegreeSelection(selection);
    setinputTrainingValue(selection[`name_${globalState.language}`]);
    setcompetenceOrDegreeFilter([]);
  }

  const showResults = () => {
    console.log('competenceOrDegreeSelection', competenceOrDegreeSelection);
    console.log('schoolOrOrganizationSelection', schoolOrOrganizationSelection);
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
          <SearchResults {...{ results: schoolOrOrganizationFilter, setSelection: getUserSelectionForSchoolOrAcademy }}/>
          }
          {schoolOrOrganizationSelection &&
          <SearchInput {...{ handleInput: filterDegreesOrCompetences, inputValue: inputTrainingValue, label: 'searchbox.labelSecondary' }} />
          }
          <SearchResults {...{ results: competenceOrDegreeFilter, setSelection: getUserSelectionForDegreeOrCompetence }}/>
          <button onClick={() => showResults()}>Näytä tulokset</button>
        </div>
      }
    </S.SearchBox>
  )
}
