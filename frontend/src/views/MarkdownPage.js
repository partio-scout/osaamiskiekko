import React, { useEffect } from 'react';
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
  margin-top: 3rem;
  margin-bottom: 3rem;
  padding: 0 15%;
  position: relative;
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

const MarkdownPage = (props) => {
  let contentContainer;
  const { data, isLoading, status } = MarkdownData(props.match.params.pageName);
  const globalState = useGlobalStateContext();

  const title = (!isLoading && data) ? data[`title_${globalState.language}`] : props.match.params.pageName;

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [contentContainer]);

  return (
    <S.MarkdownPage>
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
            : <><FormattedMessage id='error.title'/>{status.message}</>} />
      <div className='content'>
        <div ref={(container) => { contentContainer = container; }} tabIndex="-1" aria-labelledby="pageTitle">
          {isLoading 
            ? ''
            : typeof data !== 'undefined'
              ? <Markdown>{data[`text_${globalState.language}`]}</Markdown>
              : <FormattedMessage id='error.text'/>}
        </div>
      </div>
    </S.MarkdownPage>
  );
}
  
export default MarkdownPage;