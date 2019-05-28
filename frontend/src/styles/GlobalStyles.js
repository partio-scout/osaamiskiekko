import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
@import url('https://fonts.googleapis.com/css?family=Fira+Sans:400,400i,700,700i|Nunito+Sans:900&display=swap');
@import url("//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css");

body {
  font-family: "Fira Sans", sans-serif;
  margin: 0px;
  padding: 0px;
  background-color: ${props => props.theme.colors.backgroundPrimary}
  color: #202020;
}

h1, h1 span {
  color: #202020;
  font-family: "Nunito Sans", sans-serif;
  font-weight: 900;
  font-size: 48px
  line-height: 52px;
}

h2, h2 span {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-weight: bold;
  font-size: 33px
  line-height: 36px;
}

h3, h3 span {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-weight: bold;
  font-size: 26px
  line-height: 28px;
}

p.lead {
  color: #202020;
  font-family: "Fira Sans", sans-serif;
  font-size: 20px
  line-height: 30px;
}

label, span.label {
  color: #202020;	
  font-family: "Fira Sans", sans-serif;
  font-size: 16px;
  letter-spacing: 2.29px;
  line-height: 15px;
}

label.secondary, span.label.secondary {
  color: #6E6E6E;
  font-family: "Fira Sans", sans-serif;
  font-size: 16px;
  letter-spacing: 2.29px;
  line-height: 15px;
}

.p {
	color: #202020;
  font-family: "Fira Sans", sans-serif;
	font-size: 18px;
	line-height: 27px;
}

@media only screen and (max-width: 730px) {
  h1, h1 span {
    color: #202020;
    font-family: "Nunito Sans", sans-serif;
    font-weight: 900;
    font-size: 37px
    line-height: 36px;
  }
  
  h2, h2 span {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-weight: bold;
    font-size: 26px
    line-height: 32px;
  }
  
  h3, h3 span {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-weight: bold;
    font-size: 20px
    line-height: 28px;
  }
  
  p.lead {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-size: 18px
    line-height: 26px;
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
    line-height: 15px;
  }
  
  .p {
    color: #202020;
    font-family: "Fira Sans", sans-serif;
    font-size: 16px;
    line-height: 24px;
  }
}
`;

export default GlobalStyle;
