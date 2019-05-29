import React from 'react';
import {render, shallow, mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SearchBox from '../components/SearchBox';
import SearchResults from '../components/SearchResults';
import SearchInput from '../components/SearchInput';
import * as testHelper from '../testHelpers';
import schoolData from '../__testdata__/schoolData'

configure({adapter: new Adapter()});

describe('search results', () => {
  test('shows results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchResults results={schoolData} />));
    expect(wrapper.find('li.search-result-item').length).toBe(schoolData.length);
  });

  test('calls selection handler', () => {
    const setSelectionCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchResults results={schoolData} setSelection={setSelectionCallback} />));
    wrapper.find('li.search-result-item').first().simulate('click');
    expect(setSelectionCallback.mock.calls.length).toBe(1);
  });
});


describe('search input', () => {
  test('shows results', () => {
    const showPreResultsCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchInput label='searchbox.label' results={schoolData} showPreResults={showPreResultsCallback} />));
    wrapper.find('input').simulate('click');
    expect(wrapper.find('li.search-result-item').length).toBe(schoolData.length);
  });

  test('calls showPreResults', () => {
    const showPreResultsCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchInput label='searchbox.label' results={[]} showPreResults={showPreResultsCallback} />));
    wrapper.find('input').simulate('click');
    wrapper.find('input').simulate('focus');
    expect(showPreResultsCallback.mock.calls.length).toBe(2);
  });

  test('calls handleInput', () => {
    const showPreResultsCallback = jest.fn();
    const handleInputCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(
      <SearchInput 
        label='searchbox.label' 
        results={schoolData} 
        showPreResults={showPreResultsCallback}
        handleInput={handleInputCallback}
      />));
    wrapper.find('input').simulate('change', { target: { value: 'Partio' }});
    wrapper.find('input').simulate('change', { target: { value: 'Doesntexist' }});
    expect(handleInputCallback.mock.calls.length).toBe(2);
  });

  test('calls selection handler', () => {
    const setSelectionCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchResults results={schoolData} setSelection={setSelectionCallback} />));
    wrapper.find('li.search-result-item').first().simulate('click');
    expect(setSelectionCallback.mock.calls.length).toBe(1);
  });
});

describe('search box', () => {
  test('shows results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchBox data={schoolData} isLoading={false} />));
    wrapper.find('.search-school input').simulate('click');
    expect(wrapper.find('li.search-result-item').length).toBe(schoolData.length);
  });

  test('filters results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchBox data={schoolData} isLoading={false} />));
    wrapper.find('.search-school input').simulate('click');
    expect(wrapper.find('li.search-result-item').length).toBe(schoolData.length);
    wrapper.find('input').simulate('change', { target: { value: 'Partio' }});
    expect(wrapper.find('li.search-result-item').length).toBe(1);
  });

});
