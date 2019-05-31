import React from 'react';
import styled from 'styled-components';
// import { DebounceInput } from 'react-debounce-input';
import { FormattedMessage, injectIntl } from 'react-intl';
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
  color: ${props => props.theme.colors.textColor};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 20px;
}

input {
  height: 32px;
  border: none;
  border-bottom: 2px solid ${props => props.theme.colors.textColor};
  padding-left: 32px;
  outline-width: 0;
  outline: none;
  font-size: 20px;	
  line-height: 30px;
}

input::placeholder {
  color: ${props => props.theme.colors.textColor};
  opacity: 1;
  font-size: 20px;	
  line-height: 30px;
}

.fa-search { 
  position: relative;
  left: 0px;
  top: 29px;
  width: 22px;
  font-size: 22px;
  color: ${props => props.theme.colors.textColor};
}
`;

export default injectIntl(function SearchInput(props) {
  const { handleInput, inputValue, labelKey, name, results, setSelection, showPreResults } = props;
  return (
      <S.SearchWrapper>
        <label htmlFor="search-input">
          <FormattedMessage id={labelKey} />
        </label>
        <span className="fa fa-search"></span>
        <input
          minLength={2}
          // debounceTimeout={300}
          value={inputValue}
          type="text"
          placeholder={props.intl.formatMessage({id: 'search.placeholder', defaultMessage: 'Search...'})}
          name={name}
          onChange={e => handleInput(e.target.value)} 
          onClick={(e) => showPreResults(e.target.name)}
          onFocus={(e) => showPreResults(e.target.name)}
          autoComplete="off"
        />
        <SearchResults
          results={results}
          setSelection={setSelection}
        />
      </S.SearchWrapper>
  )
});
