import React from 'react';

const Background = () => {
  return (
      <svg width="1440px" height="1028px" viewBox="0 0 1440 1028" version="1.1" xmlns="http://www.w3.org/2000/svg" xlink="http://www.w3.org/1999/xlink">
        <title>header-bg</title>
        <desc>Created with Sketch.</desc>
        <defs>
          <path d="M0,0 L1441,0 L1440,593 C1200.9891,633 961.32243,653 721,653 C480.67757,653 240.344237,633 0,593 L0,0 Z" id="path-1"></path>
          <rect id="path-3" x="0" y="0" width="720" height="653"></rect>
          <pattern id="pattern-5" patternUnits="objectBoundingBox" y="-11.8180023%" height="111.818002%" width="100%">
            <use href="#image-6" transform="scale(2.6581741,2.6581741)"></use>
          </pattern>
          <image id="image-6" width="475" height="320" href="../images/headerimage.jpg"></image>
        </defs>
        <g id="Visual" stroke="none" strokeWidth="1" fill="none" fillRule="evenodd">
          <g id="Option-B-Copy">
            <g id="header-bg">
              <path d="M1440,593 L1440,968 C1200.00224,1008 960.002241,1028 720,1028 C479.997759,1028 239.997759,1008 0,968 L0,593 C240.344237,633 480.67757,653 721,653 C961.32243,653 1200.9891,633 1440,593 Z" id="bottom-bg" fill="#C9D0B7"></path>
              <mask id="mask-2" fill="white">
                <use href="#path-1"></use>
              </mask>
              <use id="bg" fill="#E8EAE3" href="#path-1"></use>
              <g id="kuva" mask="url(#mask-2)">
                <g transform="translate(720.000000, 0.000000)">
                  <mask id="mask-4" fill="white">
                    <use href="#path-3"></use>
                  </mask>
                  <g id="Mask" stroke="none" fill="none"></g>
                  <rect id="masked-img" stroke="none" fill="url(#pattern-5)" fillRule="evenodd" mask="url(#mask-4)" x="-337" y="0" width="1252" height="688"></rect>
                </g>
              </g>
            </g >
          </g >
        </g >
      </svg >
  );
}

export default Background;