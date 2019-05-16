import React from 'react';
import styled from 'styled-components';
import { injectIntl } from 'react-intl';

import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { themes, findTheme, defaultTheme } from '../styles/Themes';

const S = {};
S.ThemeSelector = styled.div`
position: relative;

select {
  height: 49px;	
  border-radius: 24.5px;	
  background-color: ${props => props.theme.colors.highlight};
  color: ${props => props.theme.colors.highlightText};
  padding: 5px 40px 5px 20px;
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
  width: 10px;
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

function ThemeSelector({intl}) {
  const { theme, changeTheme } = useGlobalStateContext();
  const setTheme = (e) => {
    const name = e.target.value;

    changeTheme(findTheme(name) || defaultTheme);
  }

  const themeOptions = themes.map(theme => { return (
    <option key={theme.name} value={theme.name}>
      {intl.formatMessage({ id: `themes.${theme.name}` })}
    </option> 
  )});

  return (
    <S.ThemeSelector>
      <select 
        onChange={setTheme}
        value={theme.name}
        aria-label="eep"
      >
        {themeOptions}
      </select>
    </S.ThemeSelector>
  )
}

export default injectIntl(ThemeSelector);
