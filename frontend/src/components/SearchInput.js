import React from 'react';
import styled from 'styled-components';
// import { DebounceInput } from 'react-debounce-input';
import { FormattedMessage } from 'react-intl';
import SearchResults from './SearchResults';

const S = {};
S.SearchWrapper = styled.div`
  margin: auto;
  position: relative;
  display: flex;
  flex-direction: column;
  margin-top: 30px;
  width: 80%;

label {
  height: 16px;	
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 0px;
}

input {
  height: 32px;
  border: none;
  border-bottom: 2px solid ${props => props.theme.colors.osaamisKiekkoBlue};
  padding-left: 32px;
  outline-width: 0;
  outline: none;
  font-size: 20px;	
  line-height: 30px;
}

input::placeholder {
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  opacity: 1;
  font-size: 20px;	
  line-height: 30px;
  /* color: #202020; */
}

.fa-search { 
  position: absolute;
  left: 0px;
  top: 23px;
  font-size: 22px;
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
}
`;

export default function SearchInput(props) {
  const { handleInput, inputValue, label, name, results, setSelection, showPreResults } = props;
  return (
      <S.SearchWrapper>
        <label htmlFor="search-input">
        <FormattedMessage id={label} />
        </label>
        <span className="fa fa-search"></span>
        <FormattedMessage id={label}>
          {msg => (
            <input
              minLength={2}
              // debounceTimeout={300}
              value={inputValue}
              type="text"
              placeholder={msg}
              name={name}
              onChange={e => handleInput(e.target.value)} 
              onClick={(e) => showPreResults(e.target.name)}
              onFocus={(e) => showPreResults(e.target.name)}
              autoComplete="off"
              />
          )}
        </FormattedMessage>
        <SearchResults
          results={results}
          setSelection={setSelection}
        />
      </S.SearchWrapper>
  )
}
