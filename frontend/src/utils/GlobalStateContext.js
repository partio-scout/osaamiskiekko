import React from 'react';
// import { defaultTheme } from '../styles/Themes';

export const useGlobalStateContext = () => React.useContext(GlobalStateContext);

const defaultValues = {
  language: 'fi',
  changeLanguage: (language) => {  console.log(language) },
  theme: 'defaultTheme',
  changeTheme: (theme) => { console.log(theme) },
};

const GlobalStateContext = React.createContext(defaultValues);

export default GlobalStateContext;
