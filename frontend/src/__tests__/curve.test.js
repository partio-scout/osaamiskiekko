import React from 'react';
import renderer from 'react-test-renderer';
import Curve from '../components/Curve.js';

test('Curve snapshot matches', () => {
  const component = renderer.create(
    <Curve />,
  );
  let tree = component.toJSON();
  expect(tree).toMatchSnapshot();
});
