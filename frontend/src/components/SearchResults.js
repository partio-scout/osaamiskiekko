import React, { useContext } from 'react';
import styled from 'styled-components';
import GlobalStateContext from '../utils/GlobalStateContext';

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
  width: 500px;
  margin: auto;
`;


export default function SearchResults(props) {
  const globalState = useContext(GlobalStateContext);
  const { results, setSelection } = props;
  const renderResults = (item) =>
    <S.ResultsDiv key={item.id} onClick={() => setSelection(item)}>
      <p>{item[`name_${globalState.language}`]}</p>
      { item && item.type_fi ? <p className="type">{item[`type_${globalState.language}`]}</p> : ''}
    </S.ResultsDiv>

  return (
    <S.ResultWrapper>
      {results.map(renderResults)}
    </S.ResultWrapper>
  )
}
