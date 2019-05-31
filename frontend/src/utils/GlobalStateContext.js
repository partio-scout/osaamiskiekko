import React from 'react';
// import { defaultTheme } from '../styles/Themes';

export const useGlobalStateContext = () => React.useContext(GlobalStateContext);

const defaultValues = {
  language: 'fi',
  changeLanguage: (language) => {  console.log(language) },
  currentTheme: 'defaultTheme',
  changeCurrentTheme: (theme) => { console.log(theme) },
  isLoading: true,
  error: undefined,
  nqfLevels: undefined,
  fieldOfStudies: undefined,
  schools: undefined, 
  organizations: undefined,
};

const GlobalStateContext = React.createContext(defaultValues);

export default GlobalStateContext;
