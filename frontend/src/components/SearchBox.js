import React, { useState }  from 'react';
import styled from 'styled-components';
import axios from 'axios';
import { DebounceInput } from 'react-debounce-input';
import SearchResults from './SearchResults';
import { FormattedMessage } from 'react-intl';

const S = {};
S.SearchBox = styled.div`
  top: 130px;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  height: 125px;	
  width: 587px;
  background-color: #FFFFFF;
 	box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  padding: 20px;
  display: flex;
  flex-direction: column;

  @media only screen and (max-width: 660px) {
    width: 350px;
  }
`;

S.SearchWrapper = styled.div `
  margin: auto;
  position: relative;
  display: flex;
  flex-direction: column;
  margin-top: 30px;

  /* :nth-child(1) {
    margin-bottom: 20px;
  } */

label {
  height: 16px;	
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 15px;
}

input {
  width: 250px;
  height: 32px;
  border: none;
  border-bottom: 2px solid ${props => props.theme.colors.osaamisKiekkoBlue};
  padding-left: 22px;
  outline-width: 0;
  outline: none;
}

input::placeholder {
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  opacity: 1;
}

.fa-search { 
  position: absolute;
  left: 0px;
  top: 27px;
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
}
`;

export default function SearchBox() {
  const [inputValue, setInputValue] = useState("");
  const [schools, setSchools] = useState([]);
  const [organizations, setOrganizations] = useState([]);
  const schoolsUrl = 'http://localhost:1337/schools?name_fi_contains=';
  const organizationsUrl = 'http://localhost:1337/organizations?name_fi_contains='

  const addTypeToArray = (schoolOrOrganization, type) => schoolOrOrganization.map(item => {
    if (type === 'school') {
      const o = Object.assign({}, item);
      o.type_fi = 'Oppilaitos';
      o.type_en = 'School';
      o.type_se = 'Skola'
      return o;
    }
    return null;
  })

  const fetchData = async (value) => {
    setInputValue(value);
    if (value) {
      const schools = await axios(`${schoolsUrl}${value}`);
      const schoolsWithType = addTypeToArray(schools.data, 'school');
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
      <S.SearchWrapper>
        <label htmlFor="search-academy">
          <FormattedMessage id="searchbox.label" />
        </label>
        <span className="fa fa-search"></span>
        <FormattedMessage id="search.placeholder">
        {msg => (
          <DebounceInput
            minLength={2}
            debounceTimeout={300}
            value={inputValue}
            type="text" 
            placeholder={msg} 
            name="search-academy"
            onChange={e => fetchData(e.target.value)} />
        )}
        </FormattedMessage>
      </S.SearchWrapper>
      <SearchResults schools={schools} organizations={organizations}/>
    </S.SearchBox>
  )
}
