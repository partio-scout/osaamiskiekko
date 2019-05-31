import React from 'react';
import styled from 'styled-components';

import translations from '../translations/translations';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.LanguageSelector = styled.div`
  position: relative;
  border-radius: 24.5px;	
  color: ${props => props.theme.colors.textColor};
  background-color: ${props => props.theme.colors.backgroundPrimary};
  padding: 11px 15px 10px 15px
  font-weight: bold;

.choice button {
  background-color: ${props => props.theme.colors.backgroundPrimary};
  color: ${props => props.theme.colors.textColor};
  -webkit-appearance: none;
  appearance: none;
  font-weight: bold;
  font-size: 18px;
  line-height: 20px;
  text-transform: capitalize;
  cursor: pointer;
  border: none; 

  &.selected {
    border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
  }

  :hover {
    border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
    background-size: 100% 100%;
    background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.textHighlight} 0)`};
    background-repeat: no-repeat;
  }
}

.choice:after {
  content: ' / ';
  font-weight: normal;
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
          lang={langOption}
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
        {choices}
    </S.LanguageSelector>
  )
}
