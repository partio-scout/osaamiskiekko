import React, { useRef } from "react";
import Slider from "react-slick";
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const S = {};
S.ResultsCarousel = styled.div`
  color: #FFFFFF;
  margin: auto;
  max-width: 90%;
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
      padding: 20px; 
      min-height: 80px;
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
      h3, p {
        font-size: 18px;	
        font-weight: bold;	
      }
    }
  }
  .slick-dots {
    bottom: 0px;
  }
`;

export default function ResultsCarousel(props) {
  const { sortedCarouselFields, setSelectedCarouselField } = props;
  const slider = useRef(null);
  const globalState = useGlobalStateContext();

  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 4,
    slidesToScroll: 1,
    accessibility: true,
    swipeToSlide: true,
    focusOnSelect: true,
    afterChange(index) {
      setSelectedCarouselField(sortedCarouselFields[index]);
    },
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
          initialSlide: 2
        }
      },
      {
        breakpoint: 480,
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
                <h3>{slide[`name_${globalState.language}`]}</h3>
                <p>({slide.creditingInfos.length})</p>
              </div>
            </div>
          );
        })}
    </Slider>
    </S.ResultsCarousel>
  )
}
