import React from 'react';
import styled from 'styled-components';
import classnames from 'classnames'

const S = {};
S.Button = styled.button`
font-size: 16px;	
line-height: 24px;	
text-align: center;
border-radius: 8px;	
border: none;
color: ${props => props.theme.colors.textColorLight};
background-color: ${props => props.theme.colors.highlight};
padding: 12px 10px; 
text-transform: uppercase;
letter-spacing: 4px;
cursor: pointer;

.button-icon:before {
  font-size: 20px;
  color: white;
  margin-left: 5px;
  float: right;
}


:hover, :focus {
  -webkit-box-shadow: 7px 7px 0 0 ${props => props.theme.colors.textHighlight};
  -moz-box-shadow: 7px 7px 0 0 ${props => props.theme.colors.textHighlight};
  box-shadow: 7px 7px 0 0 ${props => props.theme.colors.textHighlight};
}

&.active {
  border: 1px solid ${props => props.theme.colors.highlight};
  background-color: ${props => props.theme.colors.textColorLight};
  color: ${props => props.theme.colors.highlight};

  :hover, :focus {
    -webkit-box-shadow: 7px 7px 0 0 ${props => props.theme.colors.highlight};
    -moz-box-shadow: 7px 7px 0 0 ${props => props.theme.colors.highlight};
    box-shadow: 7px 7px 0 0 ${props => props.theme.colors.highlight};
  }
}
`;

export default function Curve(props) {
  const { onClick, value, className, active, icon } = props;
  const shareButton = icon ? {float : 'right'} : undefined;
  const classes = classnames(
    className, 
    {
      "active": active,
    }
  )

  return (
    <S.Button onClick={onClick} className={classes} style={shareButton}>
      {value}
      {icon ? <i className={`button-icon ${icon}`} style={{ marginRight: '0px' }}></i> : undefined}
    </S.Button>
  );
}
