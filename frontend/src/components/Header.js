import React from 'react';
import styled from 'styled-components';
import Navigation from './Navigation';
import { FormattedMessage } from 'react-intl';
import SearchBox from './SearchBox';

const S = {};
S.Header = styled.header`
 margin: auto;

h1 {
  color: ${props => props.theme.colors.text};
  font-family: ${props => props.theme.fonts.headingFontFamily};
  font-size: 42px;	
  font-weight: bold;	
  line-height: 46px;
  margin: 0px;
    span {
      background-size: 100% 100%;
      background-image: linear-gradient(180deg,transparent 60%,#6DE5B8 0);
      background-repeat: no-repeat;
    }
}


}

p {
	color: ${props => props.theme.colors.text};
  font-size: 20px;
  line-height: 30px;
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
