import React from 'react';
import styled from 'styled-components';

const S = {};
S.BlockQuote = styled.blockquote`
  margin-block-start: 0;
  margin-block-end: 0;
  margin-inline-start: 0;
  margin-inline-end: 0;

  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;

  font-size: 2.4rem;
  line-height: 1.3;
  font-weight: bold;

  &::before {
    content: '';
    background-image: url(${require('../images/quote-deepsea.png')});
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center 0.7rem;

    display: block;
    margin-right: 1.6rem;
    width: 4rem;
    flex-shrink: 0;
    //height: 10rem;
    align-self: stretch;
  }
`;

export default function BlockQuote ({ children }) {
  return (
    <S.BlockQuote>
      { children }
    </S.BlockQuote>
  )
}
