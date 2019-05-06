import React from 'react';
import styled from 'styled-components';

const S = {};
S.Navigation = styled.nav`
  padding-left: 200px;
ul {
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
