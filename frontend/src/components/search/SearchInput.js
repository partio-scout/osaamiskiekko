import React, { useState } from 'react';
import styled from 'styled-components';
import { FormattedMessage, injectIntl } from 'react-intl';
import _ from 'lodash';
import SearchResults from './SearchResults';

const S = {};
S.SearchWrapper = styled.div`
margin: auto;
position: relative;
display: flex;
flex-direction: column;

label {
  color: ${props => props.theme.colors.textColor};
  font-size: 16px;	
  letter-spacing: 2.29px;
  line-height: 20px;

  span {
    display: block;
    margin-bottom: 0.7em;
  }

  .input-area {
    position:relative;
  }
  
  input {
    box-sizing: border-box;
    height: 45px;
    width: 100%;
    border: none;
    border-bottom: 1px solid ${props => props.theme.colors.textColor};
    padding-left: 32px;
    outline-width: 0;
    outline: none;
    font-size: 20px;	
    line-height: 30px;
    font-weight: 300;
  }
  
  input::placeholder {
    color: ${props => props.theme.colors.textColor};
    opacity: 1;
    font-size: 20px;	
    line-height: 30px;
    font-style: italic;	
  }
  
  .fa-search { 
    position: absolute;
    width: 22px;
    font-size: 22px;
    line-height: 45px;
    color: ${props => props.theme.colors.textColor};
  }
}

@media only screen and (max-width: 767px) {
  label {
    font-size: 14px;
    letter-spacing: 2px;
    line-height: 15px;

    input, input::placeholder {
      font-size: 16px;
      line-height: 24px
    }
  
    fa-search: {
      font-size: 20px;
    }
  }

}
`;

export default injectIntl(function SearchInput(props) {
  const { handleInput, inputValue, labelKey, name, results, setSelection, showPreResults } = props;
  const [id] = useState(_.uniqueId());

  const mobileAutoScroll = () => {
    var elmnt = document.getElementById("search-box");
    if (window.innerWidth <= 767) {
      elmnt.scrollIntoView();
    }
  };

  return (
    <S.SearchWrapper name={`${name}-component`}>
      <label htmlFor={id}>
        <FormattedMessage id={labelKey} />
        <div className="input-area" role='button' onFocus={(e) => mobileAutoScroll()}> 
          <span className="fa fa-search" aria-hidden={true}></span>
          <input
            minLength={2}
            value={inputValue}
            type="text"
            placeholder={props.intl.formatMessage({id: 'search.placeholder', defaultMessage: 'Search...'})}
            name={name}
            onChange={e => handleInput(e.target.value)} 
            onClick={(e) => showPreResults(e.target.name)}
            onFocus={(e) => showPreResults(e.target.name)}
            autoComplete="off"
            id={id}
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
