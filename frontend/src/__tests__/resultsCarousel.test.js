import React from 'react';
import { configure, shallow, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ResultsCarousel from '../components/search/ResultsCarousel';
import { fieldOfStudiesData } from '../__testdata__/';
import * as testHelper from '../testHelpers';

configure({ adapter: new Adapter() });

describe('Results carousel renders items', () => {
  test('First label is correct', () => {
    //TODO mock setSelectedCarouselField?
    const carousel = mount(testHelper.wrapWithProviders(
      <ResultsCarousel sortedCarouselFields={fieldOfStudiesData} setSelectedCarouselField={undefined} />
    ));
    expect(carousel.find('.slick-current .carousel-item div p').first().text()).toEqual('Humanistiset alat ja teologia');
    expect(carousel.find('.slick-current .carousel-item div .credits-length').first().text()).toEqual('(0)');
  })
});
