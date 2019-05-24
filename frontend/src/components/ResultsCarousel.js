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


import React, { useRef } from "react";
import Slider from "react-slick";
import styled from 'styled-components';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

const S = {};
S.ResultsCarousel = styled.div`
  color: #FFFFFF;
  margin: auto;
  max-width: 90%;
  .slick-arrow {
    :before {
      color: black;
    }
  }
   .carousel-item {
     outline: none;
     div {
      font-size: 18px;	
      font-weight: bold;	
      line-height: 24px;	
      text-align: center;
      border-radius: 8px;	
      background-color: ${props => props.theme.colors.carouselColor};
      margin: 20px;
      padding: 20px; 
      min-height: 80px;
      display: flex;
      justify-content: center;
      flex-direction: column;
      justify-items: center;
      p {
        color: #FFFFFF;
        margin: 0px;
      }
      h3 {
        font-size: 16px;
        margin: 0px;
      }
      :hover {
        background-color: ${props => props.theme.colors.carouselColor};
        cursor: pointer;
      }
    }
   }
  .slick-current {
    transform: scale(1.12);
    div div div {
      background-color: ${props => props.theme.colors.accentColor};
    }
  }
  .slick-dots {
    bottom: 0px;
  }
`;

export default function ResultsCarousel(props) {
  const { carouselFields } = props;
  const slider = useRef(null);
  
  const sortedFields = carouselFields.sort((a, b) => {
    if (a.competences && b.competences) {
      // ASC  -> a.length - b.length
      // DESC -> b.length - a.length
      return b.competences.length - a.competences.length;
    }
    return null;
  });
  // Move Slick carousel to first slide, initialSlide not working
  if (slider && slider.current && slider.current.slickGoTo) {
    slider.current.slickGoTo(0);
  } 

  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 4,
    slidesToScroll: 1,
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
      <Slider ref={slider} {...settings}>
        {sortedFields.map((slide, index) => {
          return (
            <div className="carousel-item" key={slide}>
              <div>
                <h3>{slide.name_fi}</h3>
                <p>({slide.competences.length})</p>
              </div>
            </div>
          );
        })}
    </Slider>
    </S.ResultsCarousel>
  )
}
