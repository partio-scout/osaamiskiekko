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
  //max-width: 1400px;
  max-height: 300px;
  margin: auto;

  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
  
  > div {
    flex-grow: 1;
    max-width: 500px;
  }

  .col-left {
    display: flex;
    align-items: flex-start;
    flex-direction: column;
    justify-content: center;
  }
  .col-right {
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    align-items: center;
    flex-wrap: wrap;

    a {
      display: block;
      padding: 0 1rem;

      &#kentauriLogo {
        img {
          height: 8rem;
        }
      }

      &#tenMonkeysLogo {
        img {
          height: 4rem;
        }
      }

      &#okmLogo {
        img {
          height: 3rem;
        }
      }
    }

    .mock {
      visibility: hidden;
      width: 8rem;
    }
  }

  ul {
    padding: 0px;
  }

  ul li {
    list-style: none;
    display: block;
    //margin: 20px;
    a {
      color: ${props => props.theme.colors.navButtons};
      text-decoration: underline;
      font-size: 14px;	
      font-weight: bold;
      line-height: 27px;
      :hover {
        color: ${props => props.theme.colors.textHighlight};
        cursor: pointer;
      }
    }
  }

  .copyright {
    margin-top: 2rem;
    p {
      max-width: 30rem;
      font-size: 12px;
      line-height: 14px;
      color: ${props => props.theme.colors.navButtons};
      text-align: left;

      a {
        color: ${props => props.theme.colors.navButtons};
         :hover {
          color: ${props => props.theme.colors.textHighlight};
          cursor: pointer;
        }
      }
    }
  }

  @media only screen and (max-width: 767px) {
    align-items: center;
    flex-direction: column;
    max-height: 550px;
    
    .col-left {
      .footer-links {
        width: 100%;

        ul li {
          display: inherit;
          margin-left: 0;
          text-align: center;
        }
      }
      .copyright {
        margin: 2rem 0;
        p {
          text-align: center;
        }
      }
    }
    .col-right {
      flex-direction: column;
      flex-wrap: nowrap;

      #okmLogo img {
        margin-top: 2.5rem;
      }
    }
  } 
`;

export default function Footer() {
  return (
    <S.Footer aria-live="off">
      <div className="col-left">
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
      </div>
      <div className="col-right">
        <a href="https://kentauri.fi" id="kentauriLogo" target="_blank" rel="noopener noreferrer">
          <img src={require('../images/kentauri-logo-valkoinen.png')} alt="Kentaurin logo" />
        </a>
        <a href="https://10monkeysdigital.com" id="tenMonkeysLogo" target="_blank" rel="noopener noreferrer">
          <img src={require('../images/10monkeys-logo-BW-nega.png')} alt="10Monkeys logo" />
        </a>
        <a href="https://minedu.fi" id="okmLogo" target="_blank" rel="noopener noreferrer">
          <img src={require('../images/okm_fi_logo.png')} alt="Opetus- ja kulttuuriministeriö logo" />
        </a>
        <div className="mock" />
      </div>
    </S.Footer>
  )
}
