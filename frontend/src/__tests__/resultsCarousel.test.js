import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ResultsCarousel from '../components/search/ResultsCarousel';
import { fieldOfStudiesData } from '../__testdata__/';

configure({ adapter: new Adapter() });

describe('Results carousel renders items', () => {
  test('First label is correct', () => {
    const carousel = shallow(
      <ResultsCarousel sortedCarouselFields={fieldOfStudiesData} />
    ).dive()
    expect(carousel.find('.carousel-item div p').first().text()).toEqual('Humanistiset alat ja teologia')
    expect(carousel.find('.credits-length').first().text()).toEqual('(0)')
  })
});
