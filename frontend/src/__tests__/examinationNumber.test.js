import React from 'react';
import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ExaminationNumber from '../components/ExaminationNumber';
import examinationNumberData from '../__testdata__/examinationNumberData';
import * as testHelper from '../testHelpers';

configure({ adapter: new Adapter() });

describe('Examination number amount render', () => {
  test('Number renders properly', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<ExaminationNumber creditingInfoForDegree={examinationNumberData} />));

    expect(wrapper.find('p').first().text()).toEqual('Voidaan tunnustaa1tutkinnossa:')
  })
});
