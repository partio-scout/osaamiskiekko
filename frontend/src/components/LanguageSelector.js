import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.LanguageSelector = styled.div`
position: relative;

select {
  height: 49px;	
  width: 49px;	
  border-radius: 24.5px;	
  background-color: ${props => props.theme.colors.highlight};
  color: ${props => props.theme.colors.highlightText};
  padding: 5px 5px 5px 10px;
  border: 2px solid ${props => props.theme.colors.highlight};
  font-size: 14px;
  -webkit-appearance: none;
  appearance: none;
  outline: none;
  text-transform: uppercase;
  font-weight: bold;
}

select:focus {
  border: 2px solid ${props => props.theme.colors.highlightText};
}

::before {
  content: "\f0d7";
  font-family: FontAwesome;
  position: absolute;
  font-size: 5px;
  top: 0;
  right: 10px;
  width: 20%;
  height: 100%;
  text-align: center;
  font-size: 15px;
  line-height: 50px;
  color: ${props => props.theme.colors.highlightText};
  pointer-events: none;
  :hover {
    color: rgba(0, 0, 0, 0.6);
    background-color: rgba(255, 255, 255, 0.2);
  }
}
`;

export default function LanguageSelector() {
  const { changeLanguage } = useGlobalStateContext();
  const setLanguage = (e) => changeLanguage(e.target.value);

  return (
    <S.LanguageSelector>
      <select onChange={setLanguage}>
        <option value="fi">Fi</option>
        <option value="en">En</option>
        <option value="sv">Sv</option>
      </select>
    </S.LanguageSelector>
  )
}
