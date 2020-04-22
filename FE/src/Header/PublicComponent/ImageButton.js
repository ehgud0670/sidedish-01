import React from 'react';
import styled, { css } from 'styled-components'

const WrapDiv = styled.div`
  position: relative;
  margin: 16px 0 0 5px;
  float: left;

  ${props => 
    props.direction === "right" && 
    css`
      float: right;
  `};
`;

const ImageButton = props => {
  return (
    <WrapDiv direction={props.direction}>
        <a href={props.url}><img src={props.imageUrl} alt={props.imageDescription}></img></a>
    </WrapDiv>
  );
};

export default ImageButton;