export const findTheme = (name) => themes.find(theme => theme.name === name);

const green = {
  name: 'green',
  colors: {
    backgroundPrimary: '#e7eae3',
    backgroundSecondary: '#c7d0b7',
    highlight: '#7fd2ae',
    text: '#091f29',
    link: '#0e2b3c',
    highlightText: '#ffffff',
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
    highlight: '#2b44b0',
    text: '#14132c',
    link: '#1b1941',
    highlightText: '#ffffff',
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
    highlight: '#4300ee',
    text: '#262626',
    link: '#4300ee',
    highlightText: '#ffffff',
  },
  fonts: {
    headingFontFamily: 'Futura'
  }
};


export const defaultTheme = blue;

export const themes = [
  blue,
  green,
  grey,
];
