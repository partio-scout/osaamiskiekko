import React from 'react';
import styled from 'styled-components';

const S = {};
S.ResultsDiv = styled.div`
  border-bottom: 1px solid #335362;
  padding: 10px 10px 10px 10px;

  p {
    color: #241C80;
  }

  .type {
    font-size: 12px;	
    letter-spacing: 2px;
    line-height: 15px;
  }


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


export default function SearchResults(props) {
  const { schools, organizations } = props;
  const schoolsAndOrganizations = [...schools, ...organizations];
  const renderResults = (item) =>
    <S.ResultsDiv key={item.id}>
      <p>{item.name_fi}</p>
      <p className="type">{item.type_fi ? item.type_fi : 'Järjestö'}</p>
    </S.ResultsDiv>

  return (
    <div>
        <S.ResultWrapper>
          {schoolsAndOrganizations.map(renderResults)}
        </S.ResultWrapper>
    </div>
  )
}