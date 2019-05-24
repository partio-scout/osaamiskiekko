import React from 'react';
import styled from 'styled-components';

const S = {};
S.ListSchools = styled.div`

`;

const ListSchools = (props) => {
  const { selectedCarouselField, nqfLevels } = props;
  console.log('selectedCarouselField', selectedCarouselField);
  console.log('nqfLevels', nqfLevels);
  return (
    <S.ListSchools>
      {/* {selectedCarouselField.} */}
    </S.ListSchools>
  );
}

export default ListSchools;
