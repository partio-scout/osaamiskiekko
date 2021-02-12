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

  font-size: 2.0rem;
  line-height: 1.3;
  font-weight: bold;
  width: 100%;
  hyphens: auto;

  &::before {
    content: '';
    background-image: url(${require('../images/quote-tropicalocean.png')});
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center 0.7rem;

    display: block;
    margin-right: 1.6rem;
    width: 4rem;
    flex-shrink: 0;
    align-self: stretch;
  }

  @media only screen and (max-width: 767px) {
    font-size: 1.8rem;
  }
`;

export default function BlockQuote ({ children }) {
  return (
    <S.BlockQuote>
      { children }
    </S.BlockQuote>
  )
}
