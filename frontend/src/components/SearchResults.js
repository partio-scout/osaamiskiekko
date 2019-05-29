import React from 'react';
import styled from 'styled-components';
import {useGlobalStateContext} from '../utils/GlobalStateContext';

const S = {};
S.ResultsItem = styled.li`
  border-bottom: ${ props => `solid 1px ${props.theme.colors.textColor}` };
  padding: 10px 10px 10px 10px;
  :focus {
    outline: none;
    background-color: #E6E9EB;
  }

  p {
    color: ${props => props.theme.colors.textColor};
    margin: 5px;
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

S.ResultWrapper = styled.ul`
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  width: 100%;
  max-height: 224px;
  overflow-y: scroll;
  position: absolute;
  margin-top: 55px;
  z-index: 50;
  padding: 0;
  list-style: none;
`;


export default function SearchResults(props) {
  const { results, setSelection } = props;
  const globalState = useGlobalStateContext();
  
  const renderResults = (item, index) =>
    <S.ResultsItem 
      key={index}
      className='search-result-item'
      id={item.id}
      onClick={() => setSelection(item)} 
      onKeyPress={() => setSelection(item)}
      tabIndex="0">
      <p>{item[`name_${globalState.language}`]}</p>
      {item && item.type_fi ? 
        <p className="type">{item[`type_${globalState.language}`]}</p> : ''
      }
    </S.ResultsItem>

  return (
    <S.ResultWrapper>
      {results && results.map(renderResults)}
    </S.ResultWrapper>
  )
}
