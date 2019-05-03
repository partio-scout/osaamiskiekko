import React, { useState } from 'react';
import styled from 'styled-components';
import { Form } from 'semantic-ui-react'
import { Search, Grid, Header, Segment } from 'semantic-ui-react'

// const MenuLink = styled(Menu.Item)`
//   &&& {
//     color: #4736FF;
//   }

const SearchForm = styled(Form)`
&&& {
  background-color: white;
  padding: 40px 100px 40px 100px;
  text-align: center;
  border: 1px solid #4736FF;
  border-radius: 5px;
  position: relative;
  top: 180px;
  max-width: 600px;
  margin: auto;
  }
`;

const SearchLabel = styled.label`
  text-transform: uppercase;
  color: #4736FF;
`;

const StyledInput = styled.input`
  border: none;
  border-bottom: 2px solid #4736FF;
  outline: none;
  /* width: 250px; */
`;

export default function SearchBox() {
  const [searchText, setSearchText] = useState('');

  return (
    <SearchForm>
      <Form.Field>
        <label>Valitse järjestö tai oppilaitos</label>
        <StyledInput 
          placeholder='Hae järjestöä tai oppilaitosta...' 
          value={searchText}
          onChange={e => setSearchText(e.target.value)}
          type="text"
        />
      </Form.Field>
    </SearchForm>
    // <SearchForm>
    //   <SearchLabel htmlFor="organization">Valitse järjestö tai oppilaitos</SearchLabel>
    //   <StyledInput
    //     value={searchText}
    //     onChange={e => setSearchText(e.target.value)}
    //     placeholder="Hae järjestöä tai oppilaitosta..."
    //     type="text"
    //     name="organization"
    //     id="organization"
    //     required
    //   />
    // </SearchForm>
    
  );
}