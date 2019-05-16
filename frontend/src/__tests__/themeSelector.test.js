import React from 'react';
import {mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ThemeSelector from '../components/ThemeSelector';
import * as GlobalStateContext from '../utils/GlobalStateContext';
import { themes, defaultTheme, findTheme } from '../styles/Themes';
import { wrapWithProviders } from '../testHelpers';

configure({adapter: new Adapter()});

describe('themes', () => {

  test('can find green theme', () => {
    const found = findTheme('green');

    expect(found.name).toBe('green');
  });

  test('returns default theme if non-existent theme is sought', () => {
    const found = findTheme('iamsononexistentreallyanunicorn');

    expect(found.name).toBe('blue');
  });
});

describe('theme selector', () => {
  test('lists all themes', () => {
    const wrapper = mount(wrapWithProviders(
      <ThemeSelector />
    ));
    expect(wrapper.find('option').length).toBe(themes.length);
  });

  test('sets theme to global state', () => {
    const mockChangeTheme = jest.fn(theme => { globalValues.theme = theme });
    const globalValues = {
      theme: defaultTheme,
      changeTheme: mockChangeTheme
    };
    jest.spyOn(GlobalStateContext, 'useGlobalStateContext')
      .mockImplementation(() => globalValues);

    const wrapper = mount(wrapWithProviders(
      <ThemeSelector />
    ));

    wrapper.find('select').simulate('change', {target: {value : 'green'}});

    expect(mockChangeTheme.mock.calls.length).toBe(1);
    expect(globalValues.theme.name).toBe('green');
  });
});
