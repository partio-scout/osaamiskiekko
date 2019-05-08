import React from 'react';
import styled from 'styled-components';

const S = {};
S.Navigation = styled.nav`
  display: grid;
  grid-template-columns: 1fr 5fr;
ul {
  grid-column-start: 2;
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

ul li {
  padding: 20px 20px 20px 0px;
}

ul li a {
  text-decoration: none;
  color: #241C80;
}

  @media only screen and (max-width: 600px) { 
    grid-template-columns: 1fr auto;
    ul {
      grid-column-start: 1;
    }
  }
`;

export default function Navigation() {
    return (
      <S.Navigation>
        <ul className="padding-left-50">
          <li><a href="/#">Osaamiskiekko</a></li>
          <li><a href="/#">Tietoa</a></li>
          <li><a href="/#">Ota yhteyttä</a></li>
        </ul>
      </S.Navigation>
    )
}
