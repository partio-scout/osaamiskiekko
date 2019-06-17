import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { NavLink } from 'react-router-dom';

const S = {};
S.Footer = styled.div`
  background-color: ${props => props.theme.colors.highlight};
  padding: 20px;
  min-height: 150px;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;

  ul {
    padding: 0px;
  }

  ul li {
    list-style: none;
    display:inline;
    margin: 0px;
    margin: 20px;
    a {
      color: ${props => props.theme.colors.navButtons};
      text-decoration: none;
      font-size: 18px;	
      font-weight: bold;
      line-height: 27px;
      :hover {
        color: ${props => props.theme.colors.textHighlight};
        cursor: pointer;
      }
    }
  }

  .copyright p {
    font-size: 12px;
    line-height: 14px;
    color: ${props => props.theme.colors.navButtons};
    a {
      color: ${props => props.theme.colors.navButtons};
       :hover {
        color: ${props => props.theme.colors.textHighlight};
        cursor: pointer;
      }
    }
  }

  @media only screen and (max-width: 540px) {
    ul li {
      display: inherit;
    }
  } 
`;

export default function Footer() {
  return (
    <S.Footer>
      <div className="footer-links">
        <ul>
          <li className="footer-link">
            <NavLink exact={true} to="/">
              <FormattedMessage id="nav.osaamiskiekko" />
            </NavLink>
          </li>
          <li className="footer-link">
            <NavLink to="/tietoa">
              <FormattedMessage id="nav.tietoa" />
            </NavLink>
          </li>
          <li className="footer-link">
            <NavLink to="/otayhteytta">
              <FormattedMessage id="nav.otayhteytta" />
            </NavLink>
          </li>
        </ul>
      </div>
      <div className="copyright">
        <p>Sivuston toteutti <u><a href="https://www.eficode.com" target="_blank" rel="noopener noreferrer">Eficode</a></u> yhdessä <u><a href="http://osaamiskeskus.partio.fi/" target="_blank" rel="noopener noreferrer">Suomen Partiolaisten nuorisoalan osaamiskeskuksen kanssa.</a></u></p>
      </div>
    </S.Footer>
  )
}
