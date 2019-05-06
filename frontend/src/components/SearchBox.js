import React from 'react';
import styled from 'styled-components';

const S = {};
S.SearchBox = styled.div`
  top: 130px;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  width: 600px;
  border: 1px solid #4736FF;
  border-radius: 20px;
  padding: 20px;
  color: #4736FF;
`;

S.SearchWrapper = styled.div `
  max-width: 250px;
  margin: auto;
  position: relative;

  :nth-child(1) {
    margin-bottom: 20px;
  }

input {
  width: 250px;
  height: 32px;
  border: none;
  border-bottom: 1px solid #4736FF;
  padding-left: 22px;
  outline-width: 0;
  outline: none;
}

input::placeholder {
  color: #4736FF;
  opacity: 1;
}

.fa-search { 
  position: absolute;
  left: 0px;
  top: 27px;
}
`;

export default function SearchBox() {
  return (
    <S.SearchBox>
      <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse järjestö tai oppilaitos</label>
        <span className="fa fa-search"></span>
        <input placeholder="Hae..." name="search-academy"/>
      </S.SearchWrapper>
      <S.SearchWrapper>
        <label htmlFor="search-academy">Valitse koulutus</label>
        <span className="fa fa-search"></span>
        <input placeholder="Hae..." name="search-academy" />
      </S.SearchWrapper>
    </S.SearchBox>
  )
}
