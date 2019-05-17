import React from 'react';
import styled from 'styled-components';
import headerImage from '../images/headerimage.jpg';

const S = {};
S.CurveTest = styled.div`
  .header, .bottom, .nav {
    max-width: 60em;
    margin: auto;
  }

  .header {
    min-height: 450px;
    background-color: ${props => props.theme.colors.backgroundSecondary};
    width: 100%;
    display: flex;
    flex-flow: row wrap;
  }
  .nav {
    display: flex;
    align-items: center;
    width: 100%;
    position: absolute;
    height: 50px;
  }
  .navleft, .navright {
    flex: 50%;
    padding: 10px;
  }
  .navright {
    text-align: right;
  }
  .nav button {
    height: 30px;
  }
  .column {
    padding-top: 60px;
    padding-bottom: 100px;
    flex: 50%
  }
  .left {
    background-color: ${props => props.theme.colors.backgroundPrimary};
    border-radius: 0 0 0 100%/30px;
  }
  .right { 
    background: url(${headerImage});
    background-repeat: no-repeat;
    background-size: cover;
    background-color: ${props => props.theme.colors.backgroundPrimary};
    border-radius: 0 0 100%/30px 0;
  }
  .bottom {
    min-height: 140px;
    background-color: ${props => props.theme.colors.backgroundTertiary};
  }
  .curve {
    display: flex;
    background-color: ${props => props.theme.colors.backgroundTertiary};
    height: 150px;
    width: 100%;
  }
  .curveleft {
    background-color: ${props => props.theme.colors.backgroundSecondary};
    height: 300px;
    flex: 50%;
    border-radius: 0 0 0 100%/30px;
  }
  .curveright {
    background-color: ${props => props.theme.colors.backgroundSecondary};
    height: 300px;
    flex: 50%;
    border-radius: 0 0 100%/30px 0;
  }
  .search {
    position: relative;
    top: -250px;
    width: 50%;
    margin: auto;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
    border-radius: 8px;
    background-color: white;
    padding: 2em;
  }
  .content {
    position: relative;
    width: 80%;
    margin: auto;
    top: -250px;
    padding: 2em;
    box-shadow: 0 2px 8px 0 rgba(0,0,0,0.24);
    border-radius: 8px;
    background-color: white;

  }
`;

const CurveTest = () => {
  return (
    <S.CurveTest>

      <div class="header">
          <div class="nav">
            <div class="navleft">
                <span>These</span>
                <span>Base</span>
                <span>Are</span>
            </div>
            <div class="navright">
              <button>Buttons!</button>
              <button>Cute!</button>
              <button>Kitten!</button>
            </div>
          </div>
          <div class="column left">
            <h1>Eep</h1>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
          </div>
          <div class="column right">
            Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
          </div>
      </div>
      <div class="bottom">
        <div class="curve">
          <div class="curveleft"></div>
          <div class="curveright"></div>
        </div>
        <div class="search">
          <p>
            Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
          </p>
          <p>
            Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
          </p>
        </div>
        <div class="content">
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
            <p>
              Proin suscipit metus nibh, sed molestie mi posuere a. Duis viverra elit eu lorem ultrices, ut hendrerit nibh malesuada. In vel efficitur enim, quis efficitur metus. Nam tincidunt pellentesque nisi in venenatis. Donec viverra molestie arcu, vitae facilisis magna convallis ut. Proin ultrices velit quis semper condimentum. Proin vitae aliquet erat, eu fringilla nisi.
            </p>
          </div>
      </div>
    </S.CurveTest>
  );
}

export default CurveTest;
