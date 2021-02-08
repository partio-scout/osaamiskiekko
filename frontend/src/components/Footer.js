import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { NavLink } from 'react-router-dom';

const S = {};
S.Footer = styled.footer`
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: ${props => props.theme.colors.highlight};
  padding: 3rem 1.5rem 5rem 1.5rem;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  //max-width: 1400px;
  max-height: 220px;
  margin: auto;


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
    max-width: 30rem;
    font-size: 12px;
    line-height: 14px;
    color: ${props => props.theme.colors.navButtons};
    text-align: center;

    a {
      color: ${props => props.theme.colors.navButtons};
       :hover {
        color: ${props => props.theme.colors.textHighlight};
        cursor: pointer;
      }
    }
  }

  @media only screen and (max-width: 540px) {
    align-items: flex-start;

    ul li {
      display: inherit;
      margin-left: 0;
    }
  } 
`;

export default function Footer() {
  return (
    <S.Footer aria-live="off">
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
        <p>Sivuston toteutti <u><a href="https://www.eficode.com" target="_blank" rel="noopener noreferrer">Eficode</a></u> yhdessä <u><a href="http://osaamiskeskus.partio.fi/" target="_blank" rel="noopener noreferrer">Suomen Partiolaisten nuorisoalan osaamiskeskuksen</a></u> kanssa. Etusivun kuva: MLL / Jukka Pelkonen</p>
      </div>
    </S.Footer>
  )
}
