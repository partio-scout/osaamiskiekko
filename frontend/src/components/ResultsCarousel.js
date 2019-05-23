// Hyväksiluku: competencedegreelinks
// Koulutusala: Fieldofstudy
// Järjestökoulutis: competence
// Akateeminen koulutus: academicdegree
// Oppilaitos: School
// Järjestö: Organization
// Hyväksilukujen tarkastelu
//   - Kun järjestökoulutus on valittu
//     - (Field of Studyt ja NQF - tasot on haettu aiemmin)
// - Hae hyväksiluvut jossa competence.id vastaa valittua järjestökoulutusta
//   - (/api/competencedegreelinks ? compentece.id = 123)
//   - Pura hyväksiluvut field of studyn mukaisiin listoihin
//     - Fieldofstudy.map -> {..fieldofstudy, links: links.find(link.academicdegree ==
//     = fieldofstudy.id)
//       - Renderöi listat karusellielementtiin: Koulutusalan nimi + linkkien määrä
//         - Aktivoi eniten linkkejä sisältävä karusellielementtiin
//           - Renderöi koulutusalan linkit linkkilistaksi NQF - tasoittain.


import React from "react";
import Slider from "react-slick";
import styled from 'styled-components';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const S = {};
S.ResultsCarousel = styled.div`
   .carousel-item {
     outline: none;
     div {
      color: #FFFFFF;
      font-size: 18px;	
      font-weight: bold;	
      line-height: 24px;	
      text-align: center;
      border-radius: 8px;	
      background-color: ${props => props.theme.colors.carouselColor};
      margin: 20px;
      padding: 20px; 
      :hover {
        background-color: ${props => props.theme.colors.carouselHover};;
        cursor: pointer;
      }
    }
   }
  .slick-current {
    transform: scale(1.12);
  }
`;

export default function ResultsCarousel() {
  // const { showResults, data, isLoading } = props;

  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 4,
    slidesToScroll: 1,
    initialSlide: 0,
    accessibility: true,
    swipeToSlide: true,
    focusOnSelect: true,
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
      <Slider {...settings}>
      <div className="carousel-item">
        <div>
          <h3>1</h3>
        </div>
      </div>
        <div className="carousel-item">
        <div>
        <h3>2</h3>
        </div>
      </div>
        <div className="carousel-item">
        <div>
        <h3>3</h3>
          </div>
      </div>
        <div className="carousel-item">
        <div>
        <h3>4</h3>
          </div>
      </div>
        <div className="carousel-item">
        <div>
        <h3>5</h3>
          </div>
      </div>
        <div className="carousel-item">
        <div>
        <h3>6</h3>
        </div>
      </div>
    </Slider>
    </S.ResultsCarousel>
  )
}
