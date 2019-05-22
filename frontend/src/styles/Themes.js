export const findTheme = (name) => {
  const found = themes.find(theme => theme.name === name);
  return (found ? found : defaultTheme);
};

const green = {
  name: 'green',
  colors: {
    backgroundPrimary: '#e7eae3',
    backgroundSecondary: '#c7d0b7',
    backgroundTertiary: 'white',
    highlight: '#7fd2ae',
    text: '#091f29',
    link: '#0e2b3c',
    highlightText: '#ffffff',
    accentColor: '#6DE5B8',
  },
  fonts: {
    headingFontFamily: 'Futura'
  }
};

const grey = {
  name: 'grey',
  colors: {
    backgroundPrimary: '#b8c1d8',
    backgroundSecondary: '#dde6f8',
    backgroundTertiary: 'white',
    highlight: '#2b44b0',
    text: '#14132c',
    link: '#1b1941',
    highlightText: '#ffffff',
    accentColor: '#6DE5B8',
  },
  fonts: {
    headingFontFamily: 'Futura'
  }
};

const blue = {
  name: 'blue',
  colors: {
    backgroundPrimary: '#ffffff',
    backgroundSecondary: '#d6e0e5',
    backgroundTertiary: 'white',
    highlight: '#4300ee',
    text: '#262626',
    link: '#4300ee',
    highlightText: '#ffffff',
    accentColor: '#6DE5B8',
  },
  fonts: {
    headingFontFamily: 'Futura'
  }
};


export const defaultTheme = green;

export const themes = [
  blue,
  green,
  grey,
];
