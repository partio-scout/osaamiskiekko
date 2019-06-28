import React from 'react';
import { configure, shallow, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import ResultsCarousel from '../components/search/ResultsCarousel';
import { fieldOfStudiesData } from '../__testdata__/';
import { schoolData } from '../__testdata__/';
import { IntlProvider } from 'react-intl';
import * as testHelper from '../testHelpers';

configure({ adapter: new Adapter() });

describe('Results carousel renders items', () => {
  test('First label is correct', () => {
    const carousel = shallow(testHelper.wrapWithProviders(<ResultsCarousel sortedCarouselFields={fieldOfStudiesData} setSelectedCarouselField={schoolData[0]} />));
    expect(carousel.find('.carousel-item div p').first().text()).toEqual('Humanistiset alat ja teologia');
    expect(carousel.find('.credits-length').first().text()).toEqual('(0)');
  })
});
