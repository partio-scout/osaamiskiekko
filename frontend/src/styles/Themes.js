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
    themeGradientColorLeft: '#000000',
    themeGradientColorRight: '#ffffff'
  },
  fonts: {
    default: 'Fira Sans',
    headingFontFamily: 'Futura',
  }
};

const blue = {
  name: 'blue',
  colors: {
    backgroundPrimary: '#FCFCFD',
    backgroundSecondary: '#8ECCEB',
    backgroundTertiary: '#3262BF',
    highlight: '#3262BF',
    textColor: '#202020',
    textColorSecondary: '#6E6E6E',
    textColorLight: '#FFFFFF',
    linkColor: '#0063C3', 
    navButtons: '#FFFFFF',
    textHighlight: '#489AD3',
    get themeGradientColorLeft () { return this.backgroundSecondary },// blue.colors.backgroundSecondary, // '#8ECCEB',
    get themeGradientColorRight () { return this.backgroundTertiary }, //: blue.colors.backgroundTertiary //'#3262BF'
    get themeGradient () {
      return `linear-gradient(to right, ${this.themeGradientColorLeft}, ${this.themeGradientColorRight})`;
    },
  },
  fonts: {
    default: 'Fira Sans',
    headingFontFamily: 'Futura',
  }
}

export const defaultTheme = blue;

export const themes = [
  blue,
  green
];
