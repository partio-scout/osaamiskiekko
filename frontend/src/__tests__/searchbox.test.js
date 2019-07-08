import React from 'react';
import { mount, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SearchBox from '../components/search/SearchBox';
import SearchInput from '../components/search/SearchInput';
import * as testHelper from '../testHelpers';
import { schoolData } from '../__testdata__/'

configure({adapter: new Adapter()});

describe('search input', () => {
  test('shows results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchInput labelKey='search.label' options={schoolData} />));
    wrapper.find('input').simulate('click');
    expect(wrapper.find('.dropdown .item').length).toBe(schoolData.length);
  });

  test('calls selection handler', () => {
    const setSelectionCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchInput labelKey='search.label' options={schoolData} setSelection={setSelectionCallback} />));
    wrapper.find('.dropdown .item').at(1).simulate('click');
    wrapper.find('.dropdown .item').at(2).simulate('click');   
    expect(setSelectionCallback.mock.calls.length).toBe(2);
  });
});

describe('search box', () => {
  test('shows results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchBox data={schoolData} isLoading={false} clearResults={() => true} />));
    wrapper.find('.search-school input').simulate('click');
    expect(wrapper.find('.search-school .dropdown .item').length).toBe(schoolData.length);
  });

  test('filters results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchBox data={schoolData} isLoading={false} clearResults={() => true} />));
    wrapper.find('.search-school input').simulate('click');
    expect(wrapper.find('.search-school .dropdown .item').length).toBe(schoolData.length);
    wrapper.find('input').simulate('change', { target: { value: schoolData[0].name_fi }});
    expect(wrapper.find('.search-school .dropdown .item').length).toBe(1);
  });
});
