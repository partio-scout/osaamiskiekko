import React, { useContext } from 'react';
import styled from 'styled-components';
import { LanguageContext } from '../App';
import { FormattedMessage } from 'react-intl';

const S = {};
S.Navigation = styled.nav`
  display: grid;
  grid-template-columns: 1fr 4fr 1fr;
  div {
    grid-column-start: 2;
    display: flex;
    justify-content: space-between;
  }
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

ul li {
  padding: 20px 20px 20px 0px;
  display: inline-block;
}

ul li a {
  text-decoration: none;
  color: #241C80;
  :hover {
    color: teal;
    cursor: pointer;
  }
}

  @media only screen and (max-width: 600px) { 
    grid-template-columns: 1fr auto;
    ul {
      grid-column-start: 1;
    }
  }
`;

export default function Navigation() {
  const setLanguage = useContext(LanguageContext);
    return (
      <S.Navigation>
        <div>
          <ul className="menu-left">
            <li><a href="/#">
              <FormattedMessage id="nav.osaamiskiekko"/>
            </a></li>
            <li><a href="/#">
              <FormattedMessage id="nav.tietoa"/>
            </a></li>
            <li><a href="/#">
              <FormattedMessage id="nav.otayhteytta"/>
            </a></li>
          </ul>
          <ul className="menu-right">
            <li><a href="/#" onClick={() => setLanguage('en')}>En</a></li>
            <li><a href="/#" onClick={() => setLanguage('fi')}>Fi</a></li>
            <li><a href="/#" onClick={() => setLanguage('se')}>Se</a></li>
          </ul>
        </div>
      </S.Navigation>
    )
}
