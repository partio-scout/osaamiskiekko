import React, { useState } from 'react';
import styled from 'styled-components';
// import { DebounceInput } from 'react-debounce-input';
import { FormattedMessage, injectIntl } from 'react-intl';
import _ from 'lodash';
import SearchResults from './SearchResults';

const S = {};
S.SearchWrapper = styled.div`
margin: auto;
position: relative;
display: flex;
flex-direction: column;
margin-top: 1rem;
width: 80%;

label {
  color: ${props => props.theme.colors.textColor};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 20px;

  span {
    display: block;
    margin-bottom: 1.5rem;
  }

  .input-area {
    position:relative;
  }
  
  input {
    box-sizing: border-box;
    height: 32px;
    width: 100%;
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
    position: absolute;
    width: 22px;
    font-size: 22px;
    line-height: 30px;
    color: ${props => props.theme.colors.textColor};
  }
}
`;

export default injectIntl(function SearchInput(props) {
  const { handleInput, inputValue, labelKey, name, results, setSelection, showPreResults } = props;
  const [id] = useState(_.uniqueId());

  return (
      <S.SearchWrapper>
        <label htmlFor={id}>
          <FormattedMessage id={labelKey} />
          <div className="input-area">
            <span className="fa fa-search"></span>
            <input
              id={id}
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
          </div>
        </label>
        <SearchResults
          results={results}
          setSelection={setSelection}
        />
      </S.SearchWrapper>
  )
});
