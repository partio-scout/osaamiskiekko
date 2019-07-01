import React from 'react';
import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import SchoolList from '../components/search/SchoolList';
import sortedSchoolListData from '../__testdata__/sortedSchoolListData';
import fieldOfStudiesData from '../__testdata__/fieldOfStudiesData'
import * as testHelper from '../testHelpers';

configure({ adapter: new Adapter() });

describe('SchoolList renders schools', () => {
  const schoolList = mount(testHelper.wrapWithProviders(
    <SchoolList sortedSchoolList={sortedSchoolListData} currentCarouselField={fieldOfStudiesData[0]} />)
  )
  test('Item for screen readers render properly', () => {
    expect(schoolList.find('div span').first().text()).toEqual('Tällä hetkellä valitun koulutusalan Humanistiset alat ja teologia tulokset:')
  })
  test('Header in the list renders properly', () => {
    expect(schoolList.find('div h3').first().text()).toEqual('Erikoisammattitukinnot (1)')
  })
});
