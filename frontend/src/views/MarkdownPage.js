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
hyphens: auto;

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
    margin-top: 2.5rem;
  }

  p {
    margin-bottom: 1rem;
  }

  img {
    display: block;
    width: 100%;

    @media (max-width: 767px) {
      width: calc(100% + 4rem + 10%);
      max-width: calc(100% + 4rem + 10%);
      margin-left: calc(-2rem - 5%);
    }
  }

  a.link-button {
    margin-top: 0.5rem;
    display: inline-block;
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

      @media (max-width: 767px) {
        display: block;
        width: calc(100% + 4rem + 10%);
        max-width: calc(100% + 4rem + 10%);
        margin-left: calc(-2rem - 5%);
      }
    }

    @media (max-width: 767px) {
      flex-direction: column;
      align-items: stretch;

      div {
        flex-basis: unset;
      }
    }
  }

  .otayhteytta-contact-info {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;

    @media only screen and (max-width: 767px) {
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
    }

    .contact {
      flex-grow: 1;
      &.col-left {}
      &.col-right {}

      .img-container {
        width: 100%;
        max-width: 350px;

        img {
          display: block;
          width: 100%;
          margin: 0;
        }
      }

      .info-container {
        margin-left: 6rem;
        margin-top: 1rem;

        span {
          text-transform: uppercase;
          color: ${props => props.theme.colors.textHighlight};
          font-size: 1.3rem;
          font-weight: bold;
        }
      }
    }
  }
}

@media only screen and (max-width: 767px) {
  padding: 0px;

  .content {
    margin: 0 auto;
    padding: 5%;
    z-index: 8;
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
