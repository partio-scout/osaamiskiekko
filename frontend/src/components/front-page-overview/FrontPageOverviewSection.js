import React from 'react';
import styled from 'styled-components';
import { FormattedMessage } from 'react-intl';
import FrontPageOverviewPair from './FrontPageOverviewPair';
import BlockQuote from '../BlockQuote';

const S = {};
S.FrontPageOverviewSection = styled.section`
  margin-top: 8rem;
`;

export default function FrontPageOverviewSection() {
  return (
    <S.FrontPageOverviewSection>
      <FrontPageOverviewPair imagePosition="right" imageSrc={ require('../../images/front-page-1.png') } imageAlt="">
        <h2>
          <FormattedMessage id="frontPage.text1.h2" />
        </h2>
        <p>
          <FormattedMessage id="frontPage.text1.p1" />
        </p>
        <p>
          <FormattedMessage id="frontPage.text1.p2" />
        </p>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair className="blockquote-container" imagePosition="left" imageSrc={ require('../../images/front-page-2.png') } imageAlt="">
        <BlockQuote>
          <FormattedMessage id="frontPage.text2.quote" />
        </BlockQuote>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair imagePosition="right" imageSrc={ require('../../images/front-page-3.png') } imageAlt="">
        <h2>
          <FormattedMessage id="frontPage.text3.h2" />
        </h2>
        <p>
          <FormattedMessage id="frontPage.text3.p1" />
        </p>
        <p>
          <FormattedMessage id="frontPage.text3.p2" />
        </p>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair imagePosition="left" imageSrc={ require('../../images/front-page-4.png') } imageAlt="">
        <h2>
          <FormattedMessage id="frontPage.text4.h2" />
        </h2>
        <p>
          <FormattedMessage id="frontPage.text4.p1" />
        </p>
        <p>
          <FormattedMessage id="frontPage.text4.p2" />
        </p>
      </FrontPageOverviewPair>
    </S.FrontPageOverviewSection>
  )
}
