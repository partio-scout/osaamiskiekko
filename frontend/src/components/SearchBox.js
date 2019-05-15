import React, { useState }  from 'react';
import styled from 'styled-components';
import SearchInput from './SearchInput';
import { css } from '@emotion/core';
import { BarLoader } from 'react-spinners';
import getSchoolsAndOrganizations from '../api/GetSchoolsAndOrganizations';
import SearchResults from './SearchResults';

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
  const { data, isLoading, isError } = getSchoolsAndOrganizations();
  const [inputValue, setInputValue] = useState("");
  const [searchResults, setSearchResults] = useState([]);

  const filterData = (searchValue) => {
    setInputValue(searchValue);
    if (searchValue) {
      const results = data.filter(item => 
        item.name_en.toUpperCase().includes(searchValue.toUpperCase()) ||
        item.name_fi.toUpperCase().includes(searchValue.toUpperCase()) ||
        item.name_sv.toUpperCase().includes(searchValue.toUpperCase())
        );
      setSearchResults (results);
    } else {
      setSearchResults([]);
    }
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
          <SearchInput {...{ filterData, inputValue, label: 'searchbox.label' }}/>
          <SearchResults results={searchResults}/>
          {/* <SearchInput {...{ filterData, inputValue, label: 'searchbox.labelSecondary' }} /> */}
          <button>Näytä tulokset</button>
        </div>
      }
    </S.SearchBox>
  )
}
