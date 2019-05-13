import React, { useContext } from 'react';
import styled from 'styled-components';
import { LanguageContext } from '../App';
import { FormattedMessage } from 'react-intl';
import { Link } from 'react-router-dom'

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
  a {
  text-decoration: none;
  color: #241C80;
    :hover {
      color: teal;
      cursor: pointer;
    }
  }
  button {
    border: none; 
    background-color: #e29871;
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
            <li><Link to="/">
              <FormattedMessage id="nav.osaamiskiekko"/>
            </Link></li>
            <li><Link to="/tietoa">
              <FormattedMessage id="nav.tietoa"/>
            </Link></li>
            <li><Link to="/otayhteytta">
              <FormattedMessage id="nav.otayhteytta"/>
            </Link></li>
          </ul>
          <ul className="menu-right">
            <li><button onClick={() => setLanguage('en')}>En</button></li>
            <li><button onClick={() => setLanguage('fi')}>Fi</button></li>
            <li><button onClick={() => setLanguage('se')}>Se</button></li>
          </ul>
        </div>
      </S.Navigation>
    )
}
