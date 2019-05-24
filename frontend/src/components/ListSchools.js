import React from 'react';
import styled from 'styled-components';

const S = {};
S.ListSchools = styled.div`

`;

const ListSchools = (props) => {
  const { selectedCarouselField, nqfLevels } = props;

  if (selectedCarouselField && nqfLevels) {
    const schoolList = nqfLevels.map(level => {
      const lvl = parseInt(level.level);
      return {
        ...level,
        degree: selectedCarouselField.competences.filter(competence => competence.academicdegree.nqf === lvl)
      }
     });
    console.log('schoolList', schoolList)
  }


  return (
    <S.ListSchools>
      {/* {selectedCarouselField.} */}
    </S.ListSchools>
  );
}

export default ListSchools;
