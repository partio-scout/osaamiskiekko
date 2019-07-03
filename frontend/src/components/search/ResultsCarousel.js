import React, { useRef } from "react";
import Slider from "react-slick";
import styled from 'styled-components';
import { useGlobalStateContext } from '../../utils/GlobalStateContext';
import { injectIntl } from 'react-intl';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const S = {};
S.ResultsCarousel = styled.div`
  padding: 0px 40px 0px 40px;
  .slick-arrow {
    :before {
      opacity: 0.5;
      color: black;
    }
    :hover {
      :before {
        opacity: 0.75;
        color: black;
      }
    }
  }
  .carousel-item {
     outline: none;
     background: none;
     border: none;
     
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

  @media only screen and (max-width: 768px) {
    .slick-dots {
      bottom: initial;
    }
  }
`;

export default injectIntl(function ResultsCarousel(props) {
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
    accessibility: false,
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
          slidesToScroll: 1,
          centerMode: false
        }
      }
    ]
  };

  // Some hackaround to make the carousel accessible
  if(document.getElementsByClassName("slick-initialized").item(0)) {
    // Arrows
    document.getElementsByClassName("slick-prev").item(0).innerText = props.intl.formatMessage({id: 'carousel.previous'});
    document.getElementsByClassName("slick-next").item(0).innerText = props.intl.formatMessage({id: 'carousel.next'});
    // Dots
    const dots = document.getElementsByClassName("slick-dots").item(0).getElementsByTagName("li");
    for (var i = 0; i < dots.length; i++) {
      if (dots[i].className === "slick-active") {
        dots[i].setAttribute("aria-active", true);
        dots[i].getElementsByTagName("button")[0].innerText = `${props.intl.formatMessage({id: 'carousel.dot.chosen'})} ${sortedCarouselFields[i][`name_${globalState.language}`]}`;
      }
      else {
        dots[i].setAttribute("aria-active", false);
        dots[i].getElementsByTagName("button")[0].innerText = `${props.intl.formatMessage({id: 'carousel.dot'})} ${sortedCarouselFields[i][`name_${globalState.language}`]}`;
      }
      dots[i].setAttribute("role", "tab");
      dots[i].setAttribute("aria-controls", "school-list");
    };
  };

  return (
    <S.ResultsCarousel aria-live="off">
      <Slider ref={slider} {...settings}>
        {sortedCarouselFields.map((slide) => {
          return (
            <button className="carousel-item" key={slide} onClick={() => setSelectedCarouselField(slide)}>
              <div>
                <p>{slide[`name_${globalState.language}`]}</p>
                <p className="credits-length">({slide.creditingInfos.length})</p>
              </div>
            </button>
          );
        })}
      </Slider>
    </S.ResultsCarousel>
  )
});
