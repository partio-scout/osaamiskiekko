import React, { useState }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.SearchBox = styled.div`
  background-color: white;
  min-height: 125px;	
  width: 587px;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 34px;
  margin: auto;

  .search-wrapper {
    margin-bottom: 35px;
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
    margin-top: 60px;
`;

export default function SearchBox(props) {
  const { showResults } = props;
  const globalState = useGlobalStateContext();
  const { data, isLoading } = getSchoolsAndOrganizations();

  const [inputSchoolOrOrganization, setinputSchoolOrOrganization] = useState('');
  const [schoolOrOrganizationFilter, setschoolOrOrganizationFilter] = useState([]);
  const [schoolOrOrganizationSelection, setschoolOrOrganizationSelection] = useState(null);

  const [inputTrainingValue, setinputTrainingValue] = useState('');
  const [competenceOrDegreeFilter, setcompetenceOrDegreeFilter] = useState([]);

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
      setschoolOrOrganizationSelection(null);
      const results = data.filter(item => searchComparison(item, searchValue));
      results.length > 0 ?
      setschoolOrOrganizationFilter (results) :
      setschoolOrOrganizationFilter([noResults]);
      setinputTrainingValue('');
    } else {
      setschoolOrOrganizationFilter([]);
      setcompetenceOrDegreeFilter([]);
      setinputTrainingValue('');
      setschoolOrOrganizationSelection(null);
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
    setinputTrainingValue(selection[`name_${globalState.language}`]);
    setcompetenceOrDegreeFilter([]);
    showResults(schoolOrOrganizationSelection, selection);
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
        <div className="search-wrapper">
          <SearchInput 
            handleInput={filterSchoolOrOrganization} 
            inputValue={inputSchoolOrOrganization} 
            label={'searchbox.label'} 
            name={'search-school'}
            results={schoolOrOrganizationFilter}
            setSelection={getUserSelectionForSchoolOrAcademy}
            />
        {schoolOrOrganizationSelection &&
          <SearchInput 
            handleInput={filterDegreesOrCompetences}
            inputValue={inputTrainingValue} 
            label={'searchbox.labelSecondary'}
            name={'search-education' }
            results={competenceOrDegreeFilter}
            setSelection={getUserSelectionForDegreeOrCompetence}
            />
          }
        </div>
      }
    </S.SearchBox>
  )
}
