import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';

import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { themes, findTheme, defaultTheme } from '../styles/Themes';

const S = {};
S.ThemeSelector = styled.div`
position: relative;

select {
  height: 49px;	
  border-radius: 24.5px;	
  background-color: ${props => props.theme.colors.backgroundPrimary};
  color: ${props => props.theme.colors.text};
  padding: 5px 40px 5px 20px;
  font-size: 18px;	
  line-height: 27px;
  -webkit-appearance: none;
  appearance: none;
  outline: none;
  border: none;
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
  right: 15px;
  width: 10px;
  height: 100%;
  text-align: center;
  font-size: 15px;
  line-height: 50px;
  pointer-events: none;
  color: ${props => props.theme.colors.text};
  :hover {
    color: rgba(0, 0, 0, 0.6);
    background-color: rgba(255, 255, 255, 0.2);
  }
}

select option {
  padding: 30px;
}
`;

export default function ThemeSelector() {
  const { currentTheme, changeCurrentTheme } = useGlobalStateContext();

  const setTheme = (e) => {
    const name = e.target.value;

    changeCurrentTheme(findTheme(name) || defaultTheme);
  }

  const themeOptions = themes.map(theme => { return (
    <FormattedMessage key={theme.name} id={`themes.${theme.name}`}>
      {msg => (
        <option value={theme.name}>
          {msg}
        </option>
      )}
    </FormattedMessage>
  )});

  return (
    <S.ThemeSelector>
      <FormattedMessage key={currentTheme.name} id="nav.changetheme">
        {msg => (
            // eslint-disable-next-line jsx-a11y/no-onchange
            <select 
              onChange={setTheme}
              value={currentTheme.name}
              aria-label={msg}
            >
              {themeOptions}
            </select>
        )}
      </FormattedMessage>
    </S.ThemeSelector>
  )
}
