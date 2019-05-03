import _ from 'lodash';
import faker from 'faker';
import React, { Component } from 'react';
import { Search, Grid } from 'semantic-ui-react';
import styled from 'styled-components';

const SearchForm = styled.form`
  background-color: white;
  padding: 40px 100px 40px 100px;
  text-align: center;
  border: 1px solid #4736FF;
  border-radius: 5px;
  position: relative;
  top: 180px;
  max-width: 600px;
  margin: auto;
`;

const StyledInput = styled(Search)`
&&&&&&&& {
  border: none;
  /* border-bottom: 2px solid #4736FF;
  outline: none;
  color: #4736FF; */
  }
`;

const source = _.times(5, () => ({
  title: faker.company.companyName(),
  description: faker.company.catchPhrase(),
  image: faker.internet.avatar(),
  price: faker.finance.amount(0, 100, 2, '$'),
}))

export default class SearchElement extends Component {
  componentWillMount() {
    this.resetComponent()
  }

  resetComponent = () =>
    this.setState({ isLoading: false, results: [], value: '' })

  handleResultSelect = (e, { result }) => this.setState({ value: result.title })

  handleSearchChange = (e, { value }) => {
    this.setState({ isLoading: true, value })

    setTimeout(() => {
      if (this.state.value.length < 1) return this.resetComponent()

      const re = new RegExp(_.escapeRegExp(this.state.value), 'i')
      const isMatch = result => re.test(result.title)

      this.setState({
        isLoading: false,
        results: _.filter(source, isMatch),
      })
    }, 300)
  }

  render() {
    const { isLoading, value, results } = this.state

    return (
      <SearchForm>
          <label>Valitse järjestö tai oppilaitos</label>
          <StyledInput
            input={{ icon: 'search', iconPosition: 'left' }}
            loading={isLoading}
            onResultSelect={this.handleResultSelect}
            onSearchChange={_.debounce(this.handleSearchChange, 500, {
              leading: true,
            })}
            results={results}
            value={value}
            {...this.props}
            placeholder="Hae järjestöä tai oppilaitosta..."
          />
      </SearchForm>
    )
  }
}