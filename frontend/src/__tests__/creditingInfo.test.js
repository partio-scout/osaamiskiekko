import React from 'react';
import {mount, configure} from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import CreditingInfo from '../components/CreditingInfo';
import * as testHelper from '../testHelpers';
import competenceDegreeLinkData from '../__testdata__/competenceDegreeLinkData'

configure({adapter: new Adapter()});

const testLink = competenceDegreeLinkData.find(link => link.id === 1);

describe('crediting info', () => {
  test('shows correct header', () => {
    const wrapper = mount(testHelper.wrapWithProviders(<CreditingInfo creditingData={testLink} />));;
    expect(wrapper.find('.degree-info h2').text()).toBe(testLink.academicdegree.name_fi);
  });

});
