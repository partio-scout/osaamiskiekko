import React, { useState }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import OutsideClickHandler from 'react-outside-click-handler';

const S = {};
S.SearchBox = styled.div`
  background-color: white;
  min-height: 125px;	
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 34px;
  margin-top: -50px;
  z-index: 20;
  position: absolute;
  margin-left: auto;
  margin-right: auto;
  left: 0;
  right: 0;
  width: 587px;

  .search-wrapper {
  }

  @media only screen and (max-width: 767px) {
    width: 80%;
  }
`;

const loadingSpinnerOverride = css`
    margin: auto;
    margin-top: 60px;
`;

export default function SearchBox(props) {
  const { showResults, data, isLoading } = props;
  const globalState = useGlobalStateContext();

  const [institutionInput, setInstitutionInput] = useState('');
  const [institutionFilter, setInstitutionFilter] = useState([]);
  const [institutionSelection, setInstitutionSelection] = useState(null);
  const [trainingInput, setTrainingInput] = useState('');
  const [trainingFilter, setTrainingFilter] = useState([]);

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
    sessionStorage.setItem('selectedInstitute', JSON.stringify(selection));
    setInstitutionSelection(selection);
    setInstitutionInput(selection[`name_${globalState.language}`]);
    setInstitutionFilter([]);
    setTrainingFilter([]);
    setTrainingInput('');
  };

  const userTrainingSelection = (selection) => {
    if (selection.error) return;
    sessionStorage.setItem('selectedTraining', JSON.stringify(selection));
    setTrainingInput(selection[`name_${globalState.language}`]);
    setTrainingFilter([]);
    showResults(institutionSelection, selection);
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
