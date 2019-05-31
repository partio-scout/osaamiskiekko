import React from 'react';
import {mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import CreditingInfo from '../components/CreditingInfo';
import { fillData } from '../api/CreditingData';
import * as testHelper from '../testHelpers';
import {
  creditingData, competenceDegreeLinkData, schoolData, organizationData, nqfsData
} from '../__testdata__';
import translations from '../translations/translations';

configure({adapter: new Adapter()});

const testLink = creditingData.find(link => link.id === 1);

describe('crediting data', () => {
  test('fills data from globalState', () => {
    const filled = fillData(competenceDegreeLinkData[0], {
      schools: schoolData,
      organizations: organizationData,
      nqfLevels: nqfsData,
    });

    expect(filled.academicdegree.school.id).toBe(competenceDegreeLinkData[0].academicdegree.school);
    expect(filled.academicdegree.nqf.id).toBe(competenceDegreeLinkData[0].academicdegree.nqf);
    expect(filled.competence.organization.id).toBe(competenceDegreeLinkData[0].competence.organization);
    expect(filled.competence.nqf.id).toBe(competenceDegreeLinkData[0].competence.nqf);
  });
});

describe('crediting info', () => {
  test('shows correct header', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={testLink} />));
    expect(wrapper.find('.degree-info h2').text()).toBe(testLink.academicdegree.name_fi);
  });

  test('shows school name', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={testLink} />));
    expect(wrapper.find('.degree-info .institution').text()).toBe(testLink.academicdegree.school.name_fi);
  });

  test('shows organization name', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={testLink} />));
    expect(wrapper.find('.competence-info .institution').text()).toBe(testLink.competence.organization.name_fi);
  });

  test('shows not available if undefined data', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={undefined} />));
    expect(wrapper.find('h1').text()).toBe(translations.fi['creditinginfo.notfound']);
  });

  test('shows not available if missing degree data', () => {
    const {academicdegree, ...missingData} = testLink;
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={missingData} />));
    expect(wrapper.find('.degree-info h2').text()).toBe(translations.fi['creditinginfo.notfound']);
  });

  test('shows not available if missing competence data', () => {
    const {competence, ...missingData} = testLink;
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={missingData} />));
    expect(wrapper.find('.competence-info h2').text()).toBe(translations.fi['creditinginfo.notfound']);
  });

});
