import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SchoolItem from '../components/search/SchoolItem';
import sortedSchoolListData from '../__testdata__/sortedSchoolListData';

configure({ adapter: new Adapter() });


const creditingInfos = sortedSchoolListData[0].creditingInfos;
const creditingInfo = {
  ...creditingInfos[0]
}

describe('SchoolItem renders schools item', () => {
  test('First item renders properly', () => {
    const wrapper1 = shallow(
      <SchoolItem key={creditingInfo.id} creditingInfo={creditingInfo} />
    ).dive()

    expect(wrapper1.find('.text-container p').first().text()).toEqual('school1-deg1_fi')
    expect(wrapper1.find('.text-container p').at(1).text()).toEqual('school1 nimi ei mahdu yhdelle riville koska se on hirmu pitkä_fi')
  })
});
