import React, { useState }  from 'react';
import styled from 'styled-components';
import axios from 'axios';
import { DebounceInput } from 'react-debounce-input';

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

S.ResultsDiv = styled.div `
  border-bottom: 1px solid #335362;
  padding: 10px 10px 10px 10px;
  :last-child { border-bottom: none; }
  :hover {
   background-color: #E6E9EB;
   cursor: pointer;
  }
`;

S.ResultWrapper = styled.div`
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  width: 250px;
  margin: auto;
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

  const renderResults = (school) =>
    <S.ResultsDiv key={school.id}>
      <span>{school.name_fi}</span>
    </S.ResultsDiv>

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
      {/* <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse koulutus</label>
        <span className="fa fa-search"></span>
        <input placeholder="Hae..." name="search-academy" />
      </S.SearchWrapper> */}
      {schools.length > 0 ? 
        <S.ResultWrapper show={schools}>
          {schools.map(school => renderResults(school))}
        </S.ResultWrapper>
        : ''  
      }
    </S.SearchBox>
  )
}
