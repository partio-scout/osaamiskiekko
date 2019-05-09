import React, { useState }  from 'react';
import styled from 'styled-components';
import axios from 'axios';
import { DebounceInput } from 'react-debounce-input';
import SearchResults from './SearchResults';

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
  color: #241C80;
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 15px;
}

input {
  width: 250px;
  height: 32px;
  border: none;
  border-bottom: 2px solid #241C80;
  padding-left: 22px;
  outline-width: 0;
  outline: none;
}

input::placeholder {
  color: #241C80;
  opacity: 1;
}

.fa-search { 
  position: absolute;
  left: 0px;
  top: 27px;
  color: #241C80;
}
`;

export default function SearchBox() {
  const [academyOrSchool, setAcademyOrSchool] = useState("");
  const [schools, setSchools] = useState([]);
  const apiUrl = 'http://localhost:1337/schools';

  const fetchData = async (value) => {
    setAcademyOrSchool(value);
    if (value) {
      const result = await axios(apiUrl);
      setSchools(result.data);
    } else {
      setSchools([]);
    }
  }

  return (
    <S.SearchBox>
      <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse järjestö tai oppilaitos</label>
        <span className="fa fa-search"></span>
        <DebounceInput
          minLength={2}
          debounceTimeout={300}
          value={academyOrSchool}
          type="text" 
          placeholder="Hae..." 
          name="search-academy"
          onChange={e => fetchData(e.target.value)} />
      </S.SearchWrapper>
      <SearchResults schools={schools} />
    </S.SearchBox>
  )
}
