import React, { useContext } from 'react';
import styled from 'styled-components';
import { GlobalState } from '../App';
import { FormattedMessage } from 'react-intl';
import { Link } from 'react-router-dom';
import ThemeSelector from './ThemeSelector';

const S = {};
S.Navigation = styled.nav`
  display: flex;
  justify-content: space-between;
  padding: 0px 40px 0px 40px;

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
  font-size: 18px;	
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
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
    color: ${props => props.theme.colors.osaamisKiekkoBlue};
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
  const [globalState, setGlobalState] = useContext(GlobalState);
  const changeLanguage = (language) => setGlobalState({ ...globalState, language});
    return (
      <S.Navigation>
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
            <li><button onClick={() => changeLanguage('en')}>En</button></li>
            <li><button onClick={() => changeLanguage('fi')}>Fi</button></li>
            <li><button onClick={() => changeLanguage('se')}>Sv</button></li>
            <li><ThemeSelector /></li>
          </ul>
      </S.Navigation>
    )
}
