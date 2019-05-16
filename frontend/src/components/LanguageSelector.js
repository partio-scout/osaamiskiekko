import React from 'react';
import styled from 'styled-components';

import translations from '../translations/translations';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.LanguageSelector = styled.div`
position: relative;

.languageSelector {
  border-radius: 24.5px;	
  color: ${props => props.theme.colors.highlightText};
  background-color: ${props => props.theme.colors.highlight};
  padding: 11px 15px 10px 15px
  border: 2px solid ${props => props.theme.colors.highlight};
  font-weight: bold;
}

.choice button {
  background-color: ${props => props.theme.colors.highlight};
  color: ${props => props.theme.colors.highlightText};
  -webkit-appearance: none;
  appearance: none;
  font-size: 14px;
  text-transform: uppercase;
  font-weight: bold;
  cursor: pointer;
}

.choice button.selected {
  text-decoration: underline;
}

.choice:after {
  content: ' / ';
}

.choice:last-child:after {
  content: '';
}
`;

export default function LanguageSelector() {
  const { language, changeLanguage } = useGlobalStateContext();
  
  const languages = Object.keys(translations);

  const choices = languages.map(langOption => {
    return (
      <span className='choice' key={langOption} >
        <button 
          onClick={() => changeLanguage(langOption)}
          className={`languagechanger ${langOption} ${langOption === language ? 'selected' : ''}`}
          aria-label={translations[language][`nav.language.${langOption}`]}
        >
          {langOption}
        </button>
      </span>
    );
  });

  return (
    <S.LanguageSelector>
      <div className='languageSelector'>
        {choices}
      </div>
    </S.LanguageSelector>
  )
}
