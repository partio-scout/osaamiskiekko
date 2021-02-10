import React from 'react';
import Helmet from 'react-helmet';
import { FormattedMessage } from 'react-intl';
import Markdown from 'markdown-to-jsx';
import styled from 'styled-components';
import MarkdownData from '../api/MarkdownData';
import NavigationWithCurveAndTitle from '../components/NavigationWithCurveAndTitle'
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.MarkdownPage = styled.div`
max-width: 1440px;
margin: auto;
position: relative;

.content {
  margin: 0 auto;
  margin-bottom: 3rem;
  width: calc(100% - 4rem);
  max-width: 55rem;
  //padding: 0 15%;
  position: relative;

  h4 {
    color: ${props => props.theme.colors.textHighlight};
    text-transform: uppercase;
    font-size: 1.3rem;
    margin-top: 2rem;
  }

  p {
    margin-bottom: 2.5rem;
  }

  a.link-button {
    color: white;
    background-color: ${props => props.theme.colors.textHighlight};
    padding: 1rem 1.5rem;
    font-size: 1.2rem;
    font-weight: bold;
    border-radius: 0.5rem;
    text-transform: uppercase;
  }

  .two-col {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    width: 100%;

    margin: 5rem 0;

    div {
      flex-basis: 50%;
    }

    img {
      display: block;
      width: 100%;
    }
  }
}

@media only screen and (max-width: 767px) {
  padding: 0px;

  .content {
    margin: 0 0 0 0;
    padding: 5%;
    z-index: 20;
  }
}
`;

// Insert images via `require` when `[alt text](INSERT:file-name.ext)`
// is encountered in file.
const insertRequiredImages = (pageName, data) => {
  const matches = data.match(/INSERT\s*:\s*([^)" \n]+)\s*/g)

  if (matches) {
    const imageFileNames = matches.map(match => {
      return match.replace(/INSERT\s*:\s*([^)" \n]+)\s*/, '$1');
    });
    imageFileNames.forEach(imageFileName => {
      const realPath = require(`../images/${imageFileName}`)
      const re = new RegExp(`INSERT\\s*:\\s*${imageFileName}\\s*`)
      data = data.replace(re, `${realPath}`)
    });
  }

  return data
};

const MarkdownPage = (props) => {
  const { data, isLoading, status } = MarkdownData(props.pageName);

  //prependRequiredImages(data);
  //console.log(data);

  const globalState = useGlobalStateContext();

  const title = (!isLoading && data) ? data[`title_${globalState.language}`] : props.match.params.pageName;

  return (
    <S.MarkdownPage aria-busy={isLoading} aria-atomic={true}>
      <FormattedMessage id='pageTitle' values={{ subpage: title }}>
        {msg =>
          <Helmet>
            <title>{msg}</title>
          </Helmet>
        }
      </FormattedMessage>
      <NavigationWithCurveAndTitle 
        title={isLoading
          ? ''
          : typeof data !== 'undefined'
            ? <>{data[`title_${globalState.language}`]}</>
            : <><FormattedMessage id='error.title'/>{status.message}</>}
          isLoading={isLoading} />
      <main className='content' aria-busy={isLoading}>
        <div>
          {isLoading 
            ? ''
            : typeof data !== 'undefined'
              ? <Markdown>{insertRequiredImages(props.pageName, data[`text_${globalState.language}`])}</Markdown>
              : <FormattedMessage id='error.text'/>}
        </div>
      </main>
    </S.MarkdownPage>
  );
}
  
export default MarkdownPage;
