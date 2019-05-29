export const findTheme = (name) => {
  const found = themes.find(theme => theme.name === name);
  return (found ? found : defaultTheme);
};

const green = {
  name: 'green',
  colors: {
    backgroundPrimary: '#FCFDFC',
    backgroundSecondary: '#6DE5B8',
    backgroundTertiary: '#A5EFD3',
    highlight: '#0063C3',
    textColor: '#202020',
    textColorSecondary: '#6E6E6E',
    textColorLight: '#FFFFFF',
    linkColor: '#0063C3', 
    navButtons: '#FFFFFF',
    textHighlight: '#6DE5B8',
  },
  fonts: {
    default: 'Fira Sans',
    headingFontFamily: 'Futura',
  }
};

export const defaultTheme = green;

export const themes = [
  green,
];
