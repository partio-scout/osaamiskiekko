import React from 'react';
import {mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import NavigationWithCurveAndTitle from '../components/NavigationWithCurveAndTitle';
import * as testHelper from '../testHelpers';

configure({adapter: new Adapter()});

describe('Navigation with curve and title', () => {
  test('shows correct text', () => {
    const testTitle = "testTitle";
    const wrapper = mount(testHelper.wrapWithProviders(<NavigationWithCurveAndTitle title={testTitle}/>));
    expect(wrapper.find('NavigationWithCurveAndTitle').text().includes(testTitle));
  });
})