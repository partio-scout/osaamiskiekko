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
          <small>
            Lorem ipsum
          </small>
          Lorem ipsum
        </h2>
        <ul>
          <li>
            Koulutuksenjärjestäjät säästävät työajassa.
          </li>
          <li>
            Opettajien työ helpottuu.
          </li>
          <li>
            Opiskelijat saavat tasavertaisesti ja nopeasti muualla hankkimansa osaamisen tunnistettua ja tunnustettua opintopisteiden muodossa
          </li>
        </ul>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair imagePosition="left" imageSrc={ require('../../images/front-page-2.png') } imageAlt="">
        <BlockQuote>
          Näkyvyys osaamis&shy;kiekossa on veto&shy;voima&shy;tekijä niin oppi&shy;laitoksille kuin järjes&shy;töillekin!
        </BlockQuote>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair imagePosition="right" imageSrc={ require('../../images/front-page-3.png') } imageAlt="">
        <h2>
          <small>
            Kuinka mukaan?
          </small>
          Järjestötoimija
        </h2>
        <p>
          Järjestötoimija, teettekö yhteistyötä oppilaitosten kanssa? Saako teillä syntyvästä osaamisesta opintoja oppilaitoksissa?
        </p>
        <p>
          <strong>Ota yhteyttä,</strong> laitetaan osaaminen näkyväksi osaamiskiekkoon!
        </p>
      </FrontPageOverviewPair>
      <FrontPageOverviewPair imagePosition="left" imageSrc={ require('../../images/front-page-4.png') } imageAlt="">
        <h2>
          <small>
            Kuinka mukaan?
          </small>
          Opot ja opettajat
        </h2>
        <p>
          Opot ja opettajat, saako teidän oppilaitoksessa opintoja harrastuksissa ja vapaaehtoistyössä hankitusta osaamisesta?
        </p>
        <p>
          <strong>Ilmoita meille,</strong> niin teemme tämän näkyväksi osaamiskiekkoon!
        </p>
      </FrontPageOverviewPair>
    </S.FrontPageOverviewSection>
  )
}
