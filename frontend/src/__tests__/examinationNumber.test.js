import React from 'react';
import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ExaminationNumber from '../components/ExaminationNumber';
import examinationNumberData from '../__testdata__/examinationNumberData';
import * as testHelper from '../testHelpers';

configure({ adapter: new Adapter() });

describe('Examination amount component', () => {
  test('renders properly for degrees', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<ExaminationNumber creditingAmountForDegree={3} />));

    expect(wrapper.find('p').first().text()).toMatch('Tutkintoon voi tunnustaa seuraavat 3 koulutusta')
  });

  test('renders properly for competencies', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<ExaminationNumber creditingAmountForCompetence={5} />));

    expect(wrapper.find('p').first().text()).toMatch('Koulutus voidaan tunnustaa 5 tutkinnossa')
  })
});
