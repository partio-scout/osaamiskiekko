import React from 'react';
import {shallow, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import LanguageSelector from '../components/LanguageSelector';
import * as GlobalStateContext from '../utils/GlobalStateContext';

configure({adapter: new Adapter()});

describe('language selector', () => {
  test('snapshot matches', () => {
    const wrapper = shallow(
      <LanguageSelector />
    );
    expect(wrapper).toMatchSnapshot();
  });

  test('sets language to global state', () => {
    const mockChangeLanguage = jest.fn(lang => { globalValues.language = lang });
    const globalValues = {
      language: 'fi',
      changeLanguage: mockChangeLanguage
    };
    jest.spyOn(GlobalStateContext, 'useGlobalStateContext')
      .mockImplementation(() => globalValues);

    const wrapper = shallow(
      <LanguageSelector />
    );

    wrapper.find('.languagechanger.en').simulate('click');
    wrapper.find('.languagechanger.sv').simulate('click');

    expect(mockChangeLanguage.mock.calls.length).toBe(2);
    expect(globalValues.language).toBe('sv');
  });
});
