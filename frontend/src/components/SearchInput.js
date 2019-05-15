import React from 'react';
import styled from 'styled-components';
import { DebounceInput } from 'react-debounce-input';
import { FormattedMessage } from 'react-intl';

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
  line-height: 15px;
}

input {
  height: 32px;
  border: none;
  border-bottom: 2px solid ${props => props.theme.colors.osaamisKiekkoBlue};
  padding-left: 22px;
  outline-width: 0;
  outline: none;
}

input::placeholder {
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  opacity: 1;
}

.fa-search { 
  position: absolute;
  left: 0px;
  top: 27px;
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
}
`;

export default function SearchBox(props) {
  const {filterData, inputValue, label} = props;
  return (
      <S.SearchWrapper>
        <label htmlFor="search-input">
        <FormattedMessage id={label} />
        </label>
        <span className="fa fa-search"></span>
        <FormattedMessage id={label}>
          {msg => (
            <DebounceInput
              minLength={2}
              debounceTimeout={300}
              value={inputValue}
              type="text"
              placeholder={msg}
              name="search-input"
              onChange={e => filterData(e.target.value)} />
          )}
        </FormattedMessage>
      </S.SearchWrapper>
  )
}
