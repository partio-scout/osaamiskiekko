import React from 'react';
import styled from 'styled-components';

const S = {};
S.FrontPageOverviewPair = styled.div`
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  margin: 5rem 0;

  .content {
    padding: 0 3rem;

    h2 {
      margin-bottom: 2rem;

      small {
        display: block;
        margin-bottom: 1rem;
        text-transform: uppercase;
        font-size: 20px;
        font-weight: 600;
        color: #7944A1;

        @media (max-width: 767px) {
          font-size: 16px;
        }
      }
    }
    p, ul, li {
      font-size: 1.5rem;
      line-height: 1.5;

      @media (max-width: 767px) {
        font-size: 1.3rem;
      }
    }

    li {
      margin-bottom: 1.5rem;
    }
  }

  .image-container {
    position: relative;
    flex-basis: 50%;
    flex-shrink: 0;
    flex-grow: 0;

    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;

    &::before {
      content: " ";
      display: block;
      width: 0;
      height: 0;
      padding-top: 68%;
    }

    img {
      position: absolute;
      top: 0;
      left: 0;
      height: 100%;
      width: 100%;
      display: block;
      object-fit: contain;
      overflow: hidden;
    }
  }

  &.image-right {
    @media only screen and (min-width: 768px) {
      justify-content: flex-end;

      .content {
        width: 40rem;
        max-width: 100%;
      }
      .image-container {
        img {
          object-position: right center;
        }
      }
    }
  }
  &.image-left {
    @media only screen and (min-width: 768px) {
      justify-content: flex-start;

      .content {
        width: 40rem;
        max-width: 100%;
        order: 2;

      }

      .image-container {
        order: 1;

        img {
          object-position: left center;
        }
      }

      &.blockquote-container {
        .content {
          padding-left: 0;
        }
      }
    }
  }

  @media only screen and (max-width: 767px) {
    flex-direction: column;
    margin: 3rem 0;

    .content {

    }
    .image-container {
      width: 100%;
      flex-basis: unset;
      margin-top: 2rem;
    }
  }
`;

export default function FrontPageOverviewPair({imagePosition, imageSrc, imageAlt, children, className}) {
  return (
    <S.FrontPageOverviewPair className={[`image-${imagePosition ? imagePosition : 'left'}`, className]}>
      <div className="content">
        {children}
      </div>
      <div className="image-container">
        <img src={imageSrc} alt={imageAlt} />
      </div>
    </S.FrontPageOverviewPair>
  );
}