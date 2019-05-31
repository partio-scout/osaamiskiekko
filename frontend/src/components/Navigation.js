import React, { useState } from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { NavLink } from 'react-router-dom';
// import ThemeSelector from './ThemeSelector';
import LanguageSelector from './LanguageSelector';
import classnames from 'classnames'
import OutsideClickHandler from 'react-outside-click-handler';

const S = {};
S.Navigation = styled.nav`
  flex-wrap: wrap;
  grid-column: nav;

  .navbar {
    padding-left: 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;

    .nav-icon {
      display: none;
    }

    a {
      img {
        width: 32px;
        height: 32px;
        margin-right: 20px;
      }
    }

    .navbar_items {
      display: flex;
      width: 100%;
      justify-content: space-between;
      align-items: center;

      .navbar_item {
        display: flex;
        margin: 0;
        padding: 0;

        .navbar_subitem {
          display: inline-block;
          margin: 24px 20px 24px 0px;

          a {
            color: ${props => props.theme.colors.textColor}
            width: 100%
            height: 100%;
            padding: 24px 0px 24px 0px;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;	

            &:hover {
              color: ${props => props.theme.colors.textColor}

              span {
                border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
                background-size: 100% 100%;
                background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.textHighlight} 0)`};
                background-repeat: no-repeat;
              }
            }
            
            &.active {
              font-weight: bold;

              span {
                border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
              }
            }

          }
        }
      }
    }
  }

  @media (max-width: 767px) {

    .navbar {
      align-items: baseline;
      width: 100%;
      padding-left: 0;

      a {
        z-index: 999;
        margin-left: 12px;

        img {
          width: 48px;
          height: 48px;
        }
      }

      .nav-icon {
        display: block;
        margin: 1em;
        width: 40px;
        z-index: 999;
      }

      .navbar_items {
        display: none;
        overflow: hidden;
        position: absolute;
        width: 100%;
        background-color: white;
        padding-top: 35px;
        padding-bottom: 25px;
        box-shadow: 0px 0px 12px 0px grey;
        border-bottom-left-radius:75px;

        .navbar_item {
          display: block;

          .navbar_subitem {
            display: block;
            text-align: center;
            width: 100%;
            padding: 0;

            a {
              display: inline-block;
              width: 100%;
              height: 100%;
              padding: 14px 0px 14px 0px;
              font-weight: normal;
            }

            div {
              background-color: white;
              button {
                background-color: white;
              }
            }
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
  
  .activated:before { transform: translateY(12px) rotate(135deg); }
  .activated:after { transform: translateY(-12px) rotate(-135deg); }
  .activated div { transform: scale(0); }

  @keyframes slide-down {
    0% { opacity: 1; max-height: 0px; }
    100% { opacity: 1; max-height: 100vh; }
  }
  
  @keyframes slide-up {
    0% { display: block; max-height: 100vh; }
    100% { display: none; max-height: 0; }
  }
`;

export default function Navigation() {
  const [navmenuVisible, setNavmenuVisible] = useState(false)
  const navbar_items = classnames({
    "navbar_items": true,
    "visible": navmenuVisible
  })
  const icon = classnames({
    "nav-icon": true,
    "activated": navmenuVisible
  })

  return (
    <S.Navigation>
      <OutsideClickHandler onOutsideClick={() => setNavmenuVisible(false)} >
        <div className="navbar">
          <NavLink exact={true} to="/">
            <FormattedMessage id="nav.frontpage">
              {msg => <img src={`${window.location.origin}/icons/favicon-96x96.png`} alt={msg} /> }
            </FormattedMessage>
          </NavLink>
          <div className={navbar_items}>
            <ul className="navbar_item">
              <li className="navbar_subitem">
                <NavLink exact={true} to="/">
                  <FormattedMessage id="nav.osaamiskiekko"/>
                </NavLink>
              </li>
              <li className="navbar_subitem">
                <NavLink to="/tietoa">
                  <FormattedMessage id="nav.tietoa"/>
                </NavLink>
              </li>
              <li className="navbar_subitem">
                <NavLink to="/otayhteytta">
                  <FormattedMessage id="nav.otayhteytta"/>
                </NavLink>
              </li>
            </ul>
            <ul className="navbar_item">
              <li className="navbar_subitem"><LanguageSelector /></li>
            </ul>
          </div>
          <div className={icon} onClick={() => setNavmenuVisible(!navmenuVisible)}>
            <div></div>
          </div>
        </div>
      </OutsideClickHandler>
    </S.Navigation>
  )
}
