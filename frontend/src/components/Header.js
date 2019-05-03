import React from 'react'
import { Grid, Image } from 'semantic-ui-react'
import squareImage from '../images/square-image.png';
// import SearchBox from './SearchBox';
import SearchElement from './SearchElement';
import styled from 'styled-components';

const StyledImage = styled(Image)`
  &&& {
    border: 1px solid #4736FF;
  }
`;

const headerTexts = {
 paddingLeft: 20,
 color: '#4736FF'
};

const StyledH1 = styled.h1`
 font-size: 4em;
`;

const StyledP = styled.p`
 font-size: 1.2em;
`;

export default function MainMenu(){
    return (
        <Grid centered columns={2} verticalAlign='middle' stackable>
          <Grid.Row>
            <Grid.Column style={headerTexts}>
              <StyledH1>Osaamiskiekko</StyledH1>
              <StyledP>Osaamieskiekon avulla löydät harrastus- ja vapaaehtoistoiminnassa hankitun osaamisen rinnakkain tutkintoon johtavien opintojen kanssa.</StyledP>
            </Grid.Column>
            <Grid.Column>
                <StyledImage centered src={squareImage} size='medium' circular />
            </Grid.Column>
          </Grid.Row>
          <Grid.Row> 
            <SearchElement />
          </Grid.Row>
        </Grid>
    )
}