import React, { useState, useEffect }  from 'react';
import styled from 'styled-components';
import axios from 'axios';

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
  const apiUrl = 'http://localhost:1337/schools';

  async function fetchData(value) {
    const result = await axios(apiUrl);
    // setAcademyOrSchool(result.data);
    console.log('data:', result.data);
  }

  return (
    <S.SearchBox>
      <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse järjestö tai oppilaitos</label>
        <span className="fa fa-search"></span>
        <input value={academyOrSchool} onChange={e => fetchData(e.target.value)} type="text" placeholder="Hae..." name="search-academy"/>
      </S.SearchWrapper>
      {/* <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse koulutus</label>
        <span className="fa fa-search"></span>
        <input placeholder="Hae..." name="search-academy" />
      </S.SearchWrapper> */}
    </S.SearchBox>
  )
}
