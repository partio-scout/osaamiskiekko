import React from 'react';
import styled from 'styled-components';
import SearchBox from './search/SearchBox';
import ResultsCarousel from './search/ResultsCarousel';

const S = {};
S.Curve = styled.div`
  grid-column: curve;
  margin-top: -100px;
  min-height: 200px;
  @media only screen and (max-width: 767px) {
    margin-top: 0px;
  }

  svg {
    min-height: 350px;
    width: 100%;
  }

path {
  fill: ${props => props.theme.colors.accentColor};
}
`;

export default function Curve(props) {
  const { showResults, data, isLoading, sortedCarouselFields, setSelectedCarouselField, examinationAmount } = props;
  const svgCurve = (color) =>
    <svg version="1.1" viewBox="0 0 1440 370" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg">
      <g fill="none" fillRule="evenodd">
        <g transform="translate(0 -644)" fill="#6DE5B8">
          <path d="m1440 1014c-227.33-46.667-467-70-719-70s-492.33 23.333-721 70v-300c228.67-46.667 469-70 721-70s491.67 23.333 719 70v300z" />
        </g>
      </g>
    </svg>

  return (
    <S.Curve>
      <SearchBox showResults={showResults} data={data} isLoading={isLoading} examinationAmount={examinationAmount} />
        {svgCurve()}
        { sortedCarouselFields && sortedCarouselFields.length > 0 &&
          <ResultsCarousel sortedCarouselFields={sortedCarouselFields} setSelectedCarouselField={setSelectedCarouselField}/>
        }
    </S.Curve>
  )
}
