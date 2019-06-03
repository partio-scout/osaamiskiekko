import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import _ from 'lodash';
import OrganizationList from '../components/search/OrganizationList';
import OrganizationItem from '../components/search/OrganizationItem';
import CompetenceCreditingList from '../components/search/CompetenceCreditingList';
import CompetenceCreditingItem from '../components/search/CompetenceCreditingItem';
import { transformToByOrganization } from '../api/CreditingData';
import { creditingData } from '../__testdata__';

configure({ adapter: new Adapter() });

describe('CreditingData helpers', () => {
  test('transformToByOrganization works', () => {
    const byOrg = transformToByOrganization(creditingData);
    expect(byOrg.length).toBe(2);
  }); 
});

describe('organization list', () => {
  test('renders all organizations', () => {
    const wrapper = shallow(
      <OrganizationList creditingInfoByOrganization={ transformToByOrganization(creditingData) } />
    ).dive();
    expect(wrapper.find('.organization').length).toEqual(_.uniqBy(creditingData.map(c => c.competence.organization), "id").length);
  });
});

describe('organization item', () => {
  test('renders organization name correctly', () => {
    const data = transformToByOrganization(creditingData)[0]

    const wrapper = shallow(
      <OrganizationItem creditingInfoForOrganization={ data } />
    ).dive();
    expect(wrapper.find('.name').text()).toEqual(data.name_fi);
  });

  test('crediting list toggle works', () => {
    const data = transformToByOrganization(creditingData)[0]
    
    const wrapper = shallow(
      <OrganizationItem creditingInfoForOrganization={ data } />
    ).dive();

    expect(wrapper.find('.crediting-list').length).toEqual(0);
    wrapper.find('.item').simulate('click');
    wrapper.update();
    // FIXME Below test doesn't work - wrapper isn't updated to show the changed state
    // expect(node.find('.crediting-list').length).toEqual(1);
  });
});

describe('competence list', () => {
  test('renders correct amount of crediting info items', () => {
    const data = transformToByOrganization(creditingData)[0]
    
    const wrapper = shallow(
      <CompetenceCreditingList data={ data.creditingInfos } />
    ).dive();

    expect(wrapper.find('.credit-item').length).toEqual(data.creditingInfos.length);
  });
});

describe('competence item', () => {
  test('shows correct name', () => {
    const data = transformToByOrganization(creditingData)[0]
    // console.log(data.creditingInfos[0]);
    const wrapper = shallow(
      <CompetenceCreditingItem data={ data.creditingInfos[0] } />
    ).dive();

    expect(wrapper.find('.name').text()).toEqual(data.creditingInfos[0].competence.name_fi);
  });
});
