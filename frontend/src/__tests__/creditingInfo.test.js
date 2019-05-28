import React from 'react';
import {mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import CreditingInfo from '../components/CreditingInfo';
import * as testHelper from '../testHelpers';
import competenceDegreeLinkData from '../__testdata__/competenceDegreeLinkData';
import translations from '../translations/translations';

configure({adapter: new Adapter()});

const testLink = competenceDegreeLinkData.find(link => link.id === 1);

describe('crediting info', () => {
  test('shows correct header', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={testLink} />));
    expect(wrapper.find('.degree-info h2').text()).toBe(testLink.academicdegree.name_fi);
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
