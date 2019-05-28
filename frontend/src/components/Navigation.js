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
    display: flex;
    justify-content: space-between;
    align-items: center;
    .nav-icon {
      display: none;
    }
    img {
      width: 32px;
      height: 32px;
      padding-right: 20px;
    }
    .navbar_items {
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .navbar_item {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
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
      align-items: baseline;
      img {
        width: 48px;
        height: 48px;
        margin-left: 12px;
      }
      .nav-icon {
        display: block;
        float: right;
      }
      .navbar_items {
        display: block;
        margin-top: 75px;
        box-shadow: -10px 10px 15px 0px rgba(0,0,0,0.29);
        border-bottom-left-radius:75px;
        max-height: 1px;
        position: fixed;
        display: none;
        width: 100%;
        background-color: white;
        animation: slide-up 0.5s ease-in;
        padding-bottom: 25px;
        .navbar_item {
          display: block;
          img {
            display: none;
          }
          .navbar_subitem {
            padding: 14px 0px 14px 0px;
            display: block;
            cursor: pointer;
            text-align: center;
            width: 100%;
          }
        }
      }
      .visible {
        display: block;
        max-height: 90vh;
        animation: slide-down 0.5s ease-in;
      }
    }
  }

  .nav-icon {
    margin: 1em;
    width: 40px;
  }
  
  .nav-icon:after, 
  .nav-icon:before, 
  .nav-icon div {
    background-color: black;
    border-radius: 3px;
    content: '';
    display: block;
    height: 5px;
    margin: 7px 0;
    transition: all .2s ease-in-out;
  }

  .nav-icon:hover:before {
    transform: translateY(12px) rotate(135deg);
  }
  
  .nav-icon:hover:after {
    transform: translateY(-12px) rotate(-135deg);
  }
  
  .nav-icon:hover div {
    transform: scale(0);
  }

  @keyframes slide-down {
    0% {
      opacity: 1;
      max-height: 0px;
    }
  
    100% {
      opacity: 1;
      max-height: 100vh;
    }
  }
  
  @keyframes slide-up {
    0% {
      display: block;
      max-height: 100vh;
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
        <img src={`${window.location.origin}/icons/favicon-96x96.png`} alt="logo" />
        <div className={classes}>
          <ul className="navbar_item">
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
        <div className="nav-icon" onClick={() => setNavmenuVisible(!navmenuVisible)}>
          <div></div>
        </div>
      </div>
    </S.Navigation>
  )
}
