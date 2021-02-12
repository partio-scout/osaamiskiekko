import React from 'react';
import styled from 'styled-components';

const S = {};
S.Curve = styled.div`
grid-column: curve;
margin-top: -100px;
height: 370px;

svg {
  height: 370px;
  width: 100%;
}

@media only screen and (max-width: 767px) {
  margin-top: 0px;
}
`;

export default function Curve(props) {
  const svgCurve = () => {
    return (<svg version="1.1" viewBox="0 0 1440 370" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg">
      <defs>
        <linearGradient id="gradient">
          <stop
            id="stopLeft"
            offset="0%"
            style={{
              'stopOpacity': '1'
            }}
          />
          <stop
            id="stopRight"
            offset="100%"
            style={{
              'stopOpacity': '1'
            }}
          />
        </linearGradient>
      </defs>
      <g fill="none" fillRule="evenodd">
        <g transform="translate(0 -644)" fill="url(#gradient)">
          <path d={`
              m 1440 ${1014}
              c ${-480 + 80} -120, ${-960 - 80} -120, -1440 0
              v ${-300}
              c ${480 - 80} -120, ${960 + 80} -120, 1440 0
              v ${300}
              z
            `}
          />
        </g>
      </g>
    </svg>);
  }

  return (
    <S.Curve>
        {svgCurve()}
    </S.Curve>
  )
}
