import React, { useState } from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { Link } from 'react-router-dom';
import ThemeSelector from './ThemeSelector';
import LanguageSelector from './LanguageSelector';
import classnames from 'classnames'

const S = {};
S.Navigation = styled.nav`
  flex-wrap: wrap;
  grid-column: nav;

  .navbar {
    .navbar_items {
      display: flex;
      justify-content: space-between;
      .navbar_item {
        list-style-type: none;
        margin: 0;
        padding: 0;
        align-items: center;
        display: flex;
        img {
          padding-right: 20px;
        }
        .navbar_subitem {
          padding: 24px 20px 24px 0px;
          display: inline-block;
          a {
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;	
            color: ${props => props.theme.colors.link};
            :hover {
              color: ${props => props.theme.colors.accentColor};
              cursor: pointer;
            }
          }
          button {
            border: none; 
            border-radius: 8px;
            padding: 6px;
            color: ${props => props.theme.colors.link};
          }
        }
      }
    }
  }

  @media (max-width: 730px) { 
    .navbar {
      padding-left: 0;
      .burger {
        width: 30px;
        height: 30px;
        float: right;
        margin: 10px;
        background-image: url("/icons/favicon-32x32.png");
      }
      .navbar_items {
        box-shadow: -12px 15px 33px 0px rgba(0,0,0,0.29);
        border-radius:0px 0px 0px 50px / 0px 0px 0px 50px;
        max-height: 1px;
        position: fixed;
        display: none;
        width: 100vw;
        background-color: white;
        z-index: 999;
        animation: slide-up 0.5s ease-in;
        .navbar_item {
          display: block;
          .navbar_subitem {
            padding: 14px 0px 14px 0px;
            display: block;
            cursor: pointer;
            text-align: center;
          }
        }
      }
    
      .visible {
        display: block;
        max-height: 90vh;
        animation: slide-down 0.3s ease-in;
      }
    }
  }

  @keyframes slide-down {
    0% {
      opacity: 1;
      max-height: 0px;
    }
  
    100% {
      opacity: 1;
      max-height: 90vh;
    }
  }
  
  @keyframes slide-up {
    0% {
      display: block;
      max-height: 90vh;
    }
  
    100% {
      display: none;
      max-height: 0;
    }
  }
`;

export default function Navigation() {
  const [navmenuVisible, setNavmenuVisible] = useState(false)
  const classes = classnames({
    "navbar_items": true,
    "visible": navmenuVisible
  })

  return (
    <S.Navigation>
      <div className="navbar">
        <div className={classes}>
          <ul className="navbar_item">
            <img src={`${window.location.origin}/icons/favicon-32x32.png`} alt="logo" />
            <li className="navbar_subitem"><Link to="/">
              <FormattedMessage id="nav.osaamiskiekko"/>
            </Link></li>
            <li className="navbar_subitem"><Link to="/tietoa">
              <FormattedMessage id="nav.tietoa"/>
            </Link></li>
            <li className="navbar_subitem"><Link to="/otayhteytta">
              <FormattedMessage id="nav.otayhteytta"/>
            </Link></li>
          </ul>
          <ul className="navbar_item">
            <li className="navbar_subitem"><LanguageSelector /></li>
          </ul>
        </div>
        <div className="burger" onClick={() => setNavmenuVisible(!navmenuVisible)} />
      </div>
    </S.Navigation>
  )
}
