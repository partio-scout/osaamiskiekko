import React from 'react';
import {render, shallow, mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SearchBox from '../components/SearchBox';
import SearchResults from '../components/SearchResults';
import * as testHelper from '../testHelpers';
import schoolData from '../__testdata__/schoolData'

configure({adapter: new Adapter()});

describe('search results', () => {
  test('shows results', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<SearchResults results={schoolData} />));
    expect(wrapper.find('li').length).toBe(schoolData.length);
  });

  test('calls selection handler', () => {
    const setSelectionCallback = jest.fn();
    const wrapper = mount(testHelper.wrapWithProviders(<SearchResults results={schoolData} setSelection={setSelectionCallback} />));
    wrapper.find('li').first().simulate('click');
    expect(setSelectionCallback.mock.calls.length).toBe(1);
  });
});

// test('list all data', () => {
//   const wrapper = mount(testHelper.wrapWithProviders(<SearchBox isLoading={false} data={schoolData} />));
//   wrapper.find('.search-school input').simulate('click');
//   //wrapper.find('.search-school').simulate('change', {target: {value : 'Partio'}});
//   console.log(wrapper.debug());
// });
