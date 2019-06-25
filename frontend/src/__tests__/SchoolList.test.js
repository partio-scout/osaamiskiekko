import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SchoolList from '../components/search/SchoolList';
import sortedSchoolListData from '../__testdata__/sortedSchoolListData';

configure({ adapter: new Adapter() });

describe('SchoolList renders schools', () => {
  test('First item renders properly', () => {
    const schoolList = shallow(
      <SchoolList sortedSchoolList={sortedSchoolListData} />
    )
    expect(schoolList.find('h3').first().text()).toEqual('Erikoisammattitukinnot (1)')
  })
});
