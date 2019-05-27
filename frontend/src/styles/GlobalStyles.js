import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
@import url("//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css");

body {
  background-color: ${props => props.theme.fonts.default}
  margin: 0px;
  padding: 0px;
  background-color: ${props => props.theme.colors.backgroundPrimary}
}
`;

export default GlobalStyle;
