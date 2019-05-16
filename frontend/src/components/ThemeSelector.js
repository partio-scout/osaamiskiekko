import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { themes, findTheme, defaultTheme } from '../styles/Themes';

const S = {};
S.themeSelector = styled.div`
position: relative;

select {
  height: 49px;	
  width: 160px;	
  border-radius: 24.5px;	
  background-color: ${props => props.theme.colors.highlight};
  color: ${props => props.theme.colors.highlightText};
  padding: 5px 5px 5px 20px;
  border: 2px solid ${props => props.theme.colors.highlight};;
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
  pointer-events: none;
  color: ${props => props.theme.colors.highlightText};
  :hover {
    color: rgba(0, 0, 0, 0.6);
    background-color: rgba(255, 255, 255, 0.2);
  }
}

select option {
  padding: 30px;
}
`;

export default function Navigation() {
  const { changeTheme } = useGlobalStateContext();
  const setTheme = (e) => {
    const name = e.target.value;

    changeTheme(findTheme(name) || defaultTheme);
  }

  return (
    <S.themeSelector>
      <select onChange={setTheme}>
        {themes.map(theme => { return (
          <option key={theme.name} value={theme.name}>
            {theme.name}
          </option>
        )})}
      </select>
    </S.themeSelector>
  )
}
