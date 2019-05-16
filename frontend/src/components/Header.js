import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import { FormattedMessage } from 'react-intl';
import SearchBox from './SearchBox';

const S = {};
S.Header = styled.header`
 margin: auto;

h1 {
  color: ${props => props.theme.colors.heading};
  font-family: ${props => props.theme.fonts.headingFontFamily};
  font-size: 42px;	
  font-weight: bold;	
  line-height: 46px;
  margin: 0px;
}

p {
	color: ${props => props.theme.colors.osaamisKiekkoBlue};
	font-size: 18px;
	line-height: 24px;
}

p.important {
  font-size: 24px;
  color: red;
}

.header-container {
  display: grid;
  grid-template-columns: 4fr 4fr;
  min-height: 400px;
}

.header-text {
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 40px;
}
`;

export default function Header(props) {
  const { showResults } = props;
  return (
    <S.Header>
      <Navigation />
      <div className="header-container">
        <div className="header-text">
          <h1>
            <FormattedMessage id="header.h1" />
          </h1>
          <p className="important"><FormattedMessage id="header.important" /></p>
          <p><FormattedMessage id="header.p" /></p>
        </div>
      </div>
      <SearchBox showResults={showResults}/>
    </S.Header>
  )
}
