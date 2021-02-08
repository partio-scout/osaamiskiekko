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
    content: '"';
    display: block;
    font-size: 10rem;
    margin-right: 1rem;
    align-self: flex-start;
  }
`;

export default function BlockQuote ({ children }) {
  return (
    <S.BlockQuote>
      { children }
    </S.BlockQuote>
  )

}