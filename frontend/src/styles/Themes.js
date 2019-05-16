export const findTheme = (name) => themes.find(theme => theme.name === name);

export const defaultTheme = {
  name: 'default',
  colors: {
    osaamisKiekkoBlue: '#00283B',
    heading: '#00283B',
    white: '#FFFFFF',
    osaamisKiekkoSand: '#E8EAE3'
  },
  fonts: {
    headingFontFamily: 'Futura'
  }
};

export const themes = [
  defaultTheme,
  {
    name: 'dark',
    colors: {
      osaamisKiekkoBlue: '#30312B',
      osaamisKiekkoSand: '#bac6bd'
    },
    fonts: {
      headingFontFamily: 'Futura'
    }
  }
];
