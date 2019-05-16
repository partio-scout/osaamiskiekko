import React from 'react';
import styled from 'styled-components';
import { useGlobalStateContext } from '../utils/GlobalStateContext';
import { themes, findTheme, defaultTheme } from '../styles/Themes';

const S = {};
S.themeSelector = styled.div`
position: relative;

select {
  height: 49px;	
  width: 160px;	
  border-radius: 24.5px;	
  background-color: #FFFFFF;
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  padding: 5px 5px 5px 20px;
  border: none;
  font-size: 14px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}

::before {
  content: "\f0d7";
  font-family: FontAwesome;
  position: absolute;
  font-size: 5px;
  top: 0;
  right: 10px;
  width: 20%;
  height: 100%;
  text-align: center;
  font-size: 15px;
  line-height: 50px;
  color: rgba(0, 0, 0, 0.5);
  background-color: rgba(255, 255, 255, 0.1);
  pointer-events: none;
  :hover {
    color: rgba(0, 0, 0, 0.6);
    background-color: rgba(255, 255, 255, 0.2);
  }
}

select option {
  padding: 30px;
}
`;

export default function Navigation() {
  const { changeTheme } = useGlobalStateContext();
  const setTheme = (e) => {
    const name = e.target.value;

    changeTheme(findTheme(name) || defaultTheme);
  }

  return (
    <S.themeSelector>
      <select onChange={setTheme}>
        <option value="defaultTheme">Oletusteema</option>
        <option value="darkTheme">Tumma teema</option>
      </select>
    </S.themeSelector>
  )
}
