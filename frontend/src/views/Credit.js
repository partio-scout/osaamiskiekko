import React, { useEffect } from 'react';
import Helmet from 'react-helmet';
import { FormattedMessage } from 'react-intl';
import styled from 'styled-components';
import NavigationWithCurveAndTitle from '../components/NavigationWithCurveAndTitle'
import CreditingInfo from '../components/CreditingInfo';
import CreditingData from '../api/CreditingData';
import { useGlobalStateContext } from '../utils/GlobalStateContext';

const S = {};
S.Credit = styled.div`
max-width: 1440px;
margin: auto;
position: relative;

header .title {
  padding-bottom: 65px;
}

.content {
  margin-top: -65px;
  padding: 0 15%;
  margin-bottom: 100px;
}

@media only screen and (max-width: 767px) {
  padding: 0px;
  top: 0;

  header .title {
    padding-bottom: 10px;
    padding-left: 1rem;
  }

  .topcurve {
    display: none;
  }

  .navigation {
    background-color: ${props => props.theme.colors.backgroundTertiary};
    width: 100%;
    padding: 0;
    z-index: 30;
    position: relative;
  }

  .content {
    margin-top: 0;
    padding: 0;
    z-index: 20;
  }
} 
`;

const Credit = (props) => {
  let contentContainer;
  const { data, isLoading } = CreditingData(props.match.params.id, useGlobalStateContext());
  const globalState = useGlobalStateContext();

  useEffect(() => {
    contentContainer.focus();
    window.scrollTo(0, 0);
  }, [contentContainer]);

  return (
    <S.Credit>
      <FormattedMessage id='creditinginfo.pageTitle'>
        {msg =>
          <Helmet>
            <title>{msg}</title>
          </Helmet>
        }
      </FormattedMessage>
      
      <NavigationWithCurveAndTitle title={data &&
        <FormattedMessage id="creditinginfo.title" values= {{
          degree: data.academicdegree[`name_${globalState.language}`],
          competence: data.competence[`name_${globalState.language}`],
        }} />
      } />
      <main className='content'>
        <div ref={(container) => { contentContainer = container; }} tabIndex="-1" aria-labelledby="pageTitle">
          <CreditingInfo creditingData={data} isLoading={isLoading} />
        </div>
      </main>
    </S.Credit>
  );
}

export default Credit;
