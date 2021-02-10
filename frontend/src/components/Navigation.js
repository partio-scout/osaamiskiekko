import React, { useState, useEffect } from 'react';
import { withRouter } from 'react-router-dom';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import { Link, NavLink } from 'react-router-dom';
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
    background: ${props => props.theme.colors[props.backgroundColor]};

    .nav-icon {
      display: none;
      border: none;
      background: none;
    }

    .logo {
      margin-right: 20px;
      a {
        img {
          width: 32px;
          height: 32px;
        }
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
            color: ${props => props.theme.colors[props.textColor]};
            width: 100%;
            height: 100%;
            padding: 24px 0px 24px 0px;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;	

            &:hover {
              color: ${props => props.theme.colors[props.textColor]};

              span {
                border-bottom: 2px solid ${props => props.theme.colors[props.textHighlightColor]};
                background-size: 100% 0.2rem;
                background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors[props.textHighlightColor]} 0)`};
                background-repeat: no-repeat;
                background-position-y: 100%;
              }
            }
            
            &.active {
              font-weight: bold;

              span {
                border-bottom: 2px solid ${props => props.theme.colors[props.textHighlightColor]};
              }
            }
          }
        }
      }
    }
  }

  @media (max-width: 767px) {

    .navbar {
      align-items: flex-start;
      width: 100%;
      padding-left: 0;
      background-color: ${props => props.theme.colors[props.mobileBackgroundColor]};

      .logo {
        margin-left: 12px;
        margin-top: 11.833333333px;
        // PLEASE NOTE: Fixed manually to the center!
        z-index: 999;
        a {
          img {
            width: 48px;
            height: 48px;
          }
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
            margin: 24px 0px 24px 0px;
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

              &:hover {
                span {
                  border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
                  background-image: ${props => `linear-gradient(180deg,transparent 45%, ${props.theme.colors.textHighlight} 0)`};
                }
              }

              &.active {
                span {
                  border-bottom: 2px solid ${props => props.theme.colors.textHighlight};
                }
              }
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
      .show {
        display: block;
        animation: slide-down 0.5s ease-in;
      }
      .hide {
        display: block;
        animation: slide-up 0.25s ease-out forwards;
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
    transition: all .2s ease-in-out;
    height: 5px;
    margin: 7px 0;
    // When changing the height of the icon, change the translateY
    // below to be height+margin to make the rotation work.
  }
  
  .activated:before { transform: translateY(12px) rotate(135deg); }
  .activated:after { transform: translateY(-12px) rotate(-135deg); }
  .activated div { transform: scale(0); }

  @keyframes slide-down {
    0% { opacity: 1; max-height: 0; }
    100% { opacity: 1; max-height: 100vh; }
  }
  
  @keyframes slide-up {
    0% { max-height: 100vh; }
    99% { opacity: 1; max-height: 0; }
    100% { opacity: 0; max-height: 0; }
  }
`;

const Navigation = (props) => {
  let { mode, history } = props;
  let textColor = "textColor";
  let textHighlightColor = "textHighlight";
  let backgroundColor = "backgroundPrimary";
  let mobileBackgroundColor = "backgroundPrimary";

  if (mode === 'colorful') { 
    textColor = "backgroundPrimary";
    textHighlightColor = "backgroundTertiary";
    backgroundColor = "themeGradient"; // "backgroundSecondary";
    mobileBackgroundColor = "themeGradient"; //"backgroundTertiary";
  }

  const [path, setPath] = useState();
  const [navMenuVisible, setNavMenuVisible] = useState();

  const locPath = (history && history.location) ? history.location.pathname : undefined;
  useEffect(() => {
    if (locPath !== path) {
      setPath(locPath);
      if (navMenuVisible) {
        setNavMenuVisible(false);
      }
      document.body.focus();
    }
  }, [locPath, path, setPath, setNavMenuVisible, navMenuVisible]);

  function navMenuToggle() {
    setNavMenuVisible(!navMenuVisible);
  }

  function hideIfVisible() {
    if (navMenuVisible) {
      setNavMenuVisible(false);
    }
  }

  const navbar_items = classnames({
    "navbar_items": true,
    "show": navMenuVisible,
    "hide": navMenuVisible === undefined ? false : !navMenuVisible,
  });

  const icon = classnames({
    "nav-icon": true,
    "activated": navMenuVisible
  });

  return (
    <S.Navigation textHighlightColor={textHighlightColor} backgroundColor={backgroundColor} mobileBackgroundColor={mobileBackgroundColor} textColor={textColor} aria-live="off">
      <OutsideClickHandler onOutsideClick={() => hideIfVisible()} >
        <div className="navbar">
          <div className="logo">
            <Link to="/" id="focusableLogoLink">
              <FormattedMessage id="nav.frontpage">
                {msg => <img src={`${window.location.origin}/icons/favicon-96x96.png`} alt={msg}/>}
              </FormattedMessage>
            </Link>
          </div>
          <FormattedMessage id="nav.navicon">
            {msg => <button id='focusableHamburger' className={icon} onClick={() => navMenuToggle()} aria-label={msg} aria-expanded={navMenuVisible}>
              <div></div>
            </button> }
          </FormattedMessage>
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
        </div>
      </OutsideClickHandler>
    </S.Navigation>
  );
}

export default withRouter(Navigation);
