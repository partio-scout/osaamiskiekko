import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
@import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,400i,700,700i|Nunito+Sans:900&display=swap');
@import url('https://use.fontawesome.com/releases/v5.8.2/css/all.css');

/* *{
  min-height: 0;
  min-width: 0;
} */

body {
  font-family: "Fira Sans", sans-serif;
  margin: 0px;
  padding: 0px;
  background-color: ${props => props.theme.colors.backgroundPrimary};
  color: #202020;
  min-height: 100vh;
}

#root {
  min-height: 100vh;
  position: relative;
}

#router-content-area {
  @media only screen and (max-width: 767px) {
    padding-bottom: 550px;
  }
  @media only screen and (min-width: 768px) {
    padding-bottom: 300px;
  }
}

h1, h1 span {
  color: #202020;
  font-family: "Nunito Sans", sans-serif;
  font-weight: 900;
  font-size: 48px;
  line-height: 1.1;
}

h2, h2 span {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-weight: bold;
  font-size: 33px;
  line-height: 1.1;
}

h3, h3 span {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-weight: bold;
  font-size: 26px;
  line-height: 1.1;
}

p.lead {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-size: 20px;
  line-height: 1.2;
}

label, span.label {
  color: #202020;	
  font-family: "Fira Sans", sans-serif;
  font-size: 16px;
  letter-spacing: 2.29px;
  line-height: 1;
}

label.secondary, span.label.secondary {
  color: #6E6E6E;
  font-family: "Fira Sans", sans-serif;
  font-size: 16px;
  letter-spacing: 2.29px;
  line-height: 1;
}

p {
	color: #202020;
  font-family: "Fira Sans", sans-serif;
	font-size: 18px;
	line-height: 1.5;
}

@media only screen and (max-width: 767px) {
  h1, h1 span {
    color: #202020;
    font-family: "Nunito Sans", sans-serif;
    font-weight: 900;
    font-size: 26px;
    line-height: 1.1;
  }
  
  h2, h2 span {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-weight: bold;
    font-size: 22px;
    line-height: 1.1;
  }
  
  h3, h3 span {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-weight: bold;
    font-size: 20px;
    line-height: 1.1;
  }
  
  p.lead {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-size: 18px;
    line-height: 1.2;
  }
  
  label, span.label {
    color: #202020;	
    font-family: "Fira Sans", sans-serif;
    font-size: 14px;
    letter-spacing: 2px;
    line-height: 15px;
  }
  
  label.secondary, span.label.secondary {
    color: #6E6E6E;
    font-family: "Fira Sans", sans-serif;
    font-size: 12px;
    letter-spacing: 2px;
    line-height: 1.2;
  }
  
  p {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-size: 16px;
    line-height: 1.5;
  }
}
`;

export default GlobalStyle;
