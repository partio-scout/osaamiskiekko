import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { Link } from 'react-router-dom';
import ThemeSelector from './ThemeSelector';
import LanguageSelector from './LanguageSelector';

const S = {};
S.Navigation = styled.nav`
  display: flex;
  justify-content: space-between;
  padding: 0px 40px 0px 40px;
  flex-wrap: wrap;

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  align-items: center;
  display: flex;
  img {
    padding-right: 20px;
  }
}

ul li {
  padding: 20px 20px 20px 0px;
  display: inline-block;
  a {
  text-decoration: none;
  font-size: 18px;	
  color: ${props => props.theme.colors.link};
    :hover {
      color: teal;
      cursor: pointer;
    }
  }
  button {
    border: none; 
    background-color: #c9d0b7;
    border-radius: 8px;
    padding: 6px;
    color: ${props => props.theme.colors.link};
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
    return (
      <S.Navigation>
          <ul className="menu-left">
            <img src={`${window.location.origin}/icons/favicon-32x32.png`} alt="logo" />
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
            <li><ThemeSelector /></li>
            <li><LanguageSelector /></li>
          </ul>
      </S.Navigation>
    )
}
