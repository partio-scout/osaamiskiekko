import React, { useRef } from "react";
import Slider from "react-slick";
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const S = {};
S.ResultsCarousel = styled.div`
  padding: 0px 40px 0px 40px;
  .slick-arrow {
    :before {
      color: black;
    }
  }
   .carousel-item {
     outline: none;
     div {
      font-size: 18px;	
      line-height: 24px;	
      text-align: center;
      border-radius: 8px;	
      background-color: ${props => props.theme.colors.highlight};
      margin: 20px;
      min-height: 125px;
      display: flex;
      justify-content: center;
      flex-direction: column;
      justify-items: center;
      p {
        color: ${props => props.theme.colors.textColorLight};;
        margin: 0px;
        font-size: 18px;
        font-weight: initial;
      }
      h3 {
        color: ${props => props.theme.colors.textColorLight};;
        font-size: 18px;
        margin: 0px;
        font-weight: initial;
      }
      :hover {
        background-color: ${props => props.theme.colors.highlight};
        cursor: pointer;
      }
    }
   }
  .slick-current {
    transform: scale(1.12);
    div div div {
      background-color: ${props => props.theme.colors.accentColor};
      p {
        font-size: 18px;	
        font-weight: bold;	
      }
    }
  }
`;

export default function ResultsCarousel(props) {
  const { sortedCarouselFields, setSelectedCarouselField } = props;
  const slider = useRef(null);
  const globalState = useGlobalStateContext();

  const settings = {
    className: 'center',
    centerMode: true,
    centerPadding: '60px',
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 3,
    slidesToScroll: 1,
    accessibility: true,
    swipeToSlide: true,
    focusOnSelect: true,
    afterChange(index) {
      setSelectedCarouselField(sortedCarouselFields[index]);
    },
    responsive: [
      {
        breakpoint: 1240,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 1,
        }
      },
      {
        breakpoint: 990,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 1,
        }
      },
      {
        breakpoint: 760,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      },
      {
        breakpoint: 470,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  };

  return (
    <S.ResultsCarousel>
      <Slider ref={slider} {...settings}>
        {sortedCarouselFields.map((slide) => {
          return (
            <div className="carousel-item" key={slide} onClick={() => setSelectedCarouselField(slide)}>
              <div>
                <p>{slide[`name_${globalState.language}`]}</p>
                <p>({slide.creditingInfos.length})</p>
              </div>
            </div>
          );
        })}
    </Slider>
    </S.ResultsCarousel>
  )
}
