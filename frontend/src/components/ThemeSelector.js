import React, { useContext } from 'react';
import styled from 'styled-components';
import { GlobalState } from '../App';

const S = {};
S.themeSelector = styled.div`
position: relative;

select {
  background-color: #e29871;
  color: ${props => props.theme.colors.osaamisKiekkoBlue};
  padding: 5px 5px 5px 10px;
  width: 150px;
  border: none;
  font-size: 14px;
  border-radius: 0px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}

::before {
  content: "\f13a";
  font-family: FontAwesome;
  position: absolute;
  font-size: 5px;
  top: 0;
  right: 0;
  width: 20%;
  height: 100%;
  text-align: center;
  font-size: 15px;
  line-height: 30px;
  color: rgba(255, 255, 255, 0.5);
  background-color: rgba(255, 255, 255, 0.1);
  pointer-events: none;
}

:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

 select option {
  padding: 30px;
}
`;

export default function Navigation() {
  const [globalState, setGlobalState] = useContext(GlobalState);
  const setTheme = (e) => setGlobalState({ ...globalState, theme: e.target.value });

    return (
      <S.themeSelector>
        <select onChange={setTheme}>
          <option value="defaultTheme">Oletus teema</option>
          <option value="darkTheme">Tumma teema</option>
        </select>
      </S.themeSelector>
    )
}
