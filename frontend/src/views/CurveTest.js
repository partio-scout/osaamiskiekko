import React from 'react';
import styled from 'styled-components';
import Navigation from '../components/Navigation';

const S = {};
S.CurveTest = styled.div`
max-width: 1440px;
margin: auto;
position: relative;

.topcurve {
  display: block;
  position: absolute;
  z-index: -100;
  top: 0;
  left: 0;
  right: 0;

  svg {
    width: 100%;
    path {
      fill: ${props => props.theme.colors.backgroundSecondary};
    }
  }
}

.navigation {
  padding: 0 8rem;
}

.content {
  margin-top: 3rem;
  padding: 0 14rem;
}

.credit-area {
  padding: 2rem;
  box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
  border-radius: 8px;
  background-color: ${props => props.theme.colors.backgroundTertiary}
  z-index: 10;
  position: relative;
}

.competence-info, .competence-description {
  z-index: 30;
  background-color: ${props => props.theme.colors.backgroundSecondary}
}

@media only screen and (max-width: 767px) {
  padding: 0px;
} 
`;

const CurveTest = () => {
  const svgCurve = (color) => 
    <svg viewBox="0 0 1440 352" version="1.1" xmlns="http://www.w3.org/2000/svg">
        <title>Combined Shape</title>
        <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
            <g id="Desktop---info" fill="#6DE5B8">
                <path d="M0.295915256,351.939623 L0.999306037,0 L1440,0 L1440,426 L1440,352 C1212.66667,305.333333 973,282 721,282 C469.108701,282 228.874006,305.313208 0.295915256,351.939623 Z" id="Combined-Shape"></path>
            </g>
        </g>
    </svg>

  return (
    <S.CurveTest>
      <div className='topcurve'>
        {svgCurve()}
      </div>
      <div className='navigation'>
        <Navigation />
      </div>
      <div className='content'>
        <div className='credit-area'>
          <div className='degreeInfo' >
            <h2>Degreey</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id arcu vulputate eros convallis congue.</p>
          </div>
          <div className='competence-info' >
            <h2>Compy</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id arcu vulputate eros convallis congue.</p>
          </div>
          <div className='credit-info' >
            <div className='floatybox'>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id arcu vulputate eros convallis congue. Quisque arcu risus, interdum sed diam et, pellentesque efficitur tellus. Nulla finibus lorem non rutrum ullamcorper. Mauris pulvinar ipsum vulputate urna finibus, ac viverra leo condimentum. Quisque rhoncus eu lectus tempor finibus. Curabitur elementum eleifend dolor sit amet mollis. Ut at diam congue, tempus elit a, hendrerit risus. Nullam magna tellus, convallis sit amet maximus ut, laoreet sit amet diam. Cras sollicitudin felis id congue egestas. Proin eget interdum massa. Duis ac nunc id ipsum aliquam vestibulum. Vivamus congue ac libero id iaculis. Donec fermentum dolor id porta lobortis.</p>
            </div>
          </div>
          <div className='degree-description' >
            <h2>DegreeDesc</h2>
            <p>Integer vel vulputate sem. Mauris eleifend efficitur magna, a lacinia neque tincidunt sit amet. Nam volutpat, nisi ac vulputate rutrum, turpis felis vestibulum quam, sed efficitur justo lectus quis neque. Nunc vel turpis a magna semper porttitor sit amet vitae nibh. Proin vel interdum lectus. Curabitur non volutpat turpis, sed pharetra odio. Pellentesque sed massa sit amet augue malesuada tempor nec sit amet neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam bibendum felis risus. Aliquam erat volutpat. Nunc blandit felis pulvinar dolor egestas luctus. Vivamus ultricies massa vitae sem fringilla, a dignissim neque lobortis.</p>
          </div>
          <div className='competence-description' >
            <h2>CompyDesc</h2>
            <p>Donec turpis mi, fermentum eget elit id, ullamcorper dignissim lectus. Suspendisse lobortis ante sed lobortis dapibus. Sed sit amet urna tortor. Quisque imperdiet magna sit amet mollis dignissim. Nullam erat tortor, hendrerit a vehicula nec, fringilla porttitor ligula. Etiam blandit lectus vel nunc mattis iaculis. Cras euismod mauris id turpis rutrum, id sagittis sem volutpat. Sed faucibus ac nisi id pretium. Proin sagittis libero commodo malesuada accumsan.</p>
          </div>
          <div className='footer' >
            <button>TODO TAKAISIN</button>
          </div>
        </div>
      </div>
    </S.CurveTest>
  );
}

export default CurveTest;
