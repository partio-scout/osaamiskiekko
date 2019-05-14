import React, { useState }  from 'react';
import styled from 'styled-components';
import axios from 'axios';
import SearchResults from './SearchResults';
import { addTypeToSchoolOrOrganization } from '../utils/ApiUtils';
import SearchInput from './SearchInput';

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

export default function SearchBox() {
  const [inputValue, setInputValue] = useState("");
  const [schools, setSchools] = useState([]);
  const [organizations, setOrganizations] = useState([]);
  const schoolsUrl = 'http://localhost:1337/schools?name_fi_contains=';
  const organizationsUrl = 'http://localhost:1337/organizations?name_fi_contains='

  const fetchData = async (value) => {
    setInputValue(value);
    if (value) {
      const schools = await axios(`${schoolsUrl}${value}`);
      const schoolsWithType = addTypeToSchoolOrOrganization(schools.data, 'school');
      setSchools(schoolsWithType);
      const organizations = await axios(`${organizationsUrl}${value}`);
      setOrganizations(organizations.data);
    } else {
      setSchools([]);
      setOrganizations([]);
    }
  }

  return (
    <S.SearchBox>
      <SearchInput {...{ fetchData, inputValue, label: 'searchbox.label' }} />
      <SearchResults schools={schools} organizations={organizations}/>
      <SearchInput {...{ fetchData, inputValue, label: 'searchbox.labelSecondary' }} />
      <button>Näytä tulokset</button>
    </S.SearchBox>
  )
}
