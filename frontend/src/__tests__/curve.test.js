import React from 'react';
import renderWithProviders from '../testHelpers'
import Curve from '../components/Curve';

test('Curve snapshot matches', () => {
  const tree = renderWithProviders(
        <Curve />
  ).toJSON();
  expect(tree).toMatchSnapshot();
});
