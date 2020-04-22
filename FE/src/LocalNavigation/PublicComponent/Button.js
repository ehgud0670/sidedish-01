import React from 'react';
import styled, { css } from 'styled-components'

const Div = styled.div`
  float: left;

  ${props => 
    props.direction === "right" && 
    css`
      float: right;
  `};
`;

const Anchor = styled.a`
  padding: 10px 10px 10px 10px;
  background: url(http://dev-angelo.dlinkddns.com/util_bar.gif) no-repeat;
  background-position: left;
`;

const Button = props => {
  return (
    <Div direction={props.direction}>
    <Anchor href={props.url}>{props.title}</Anchor>
    </Div>
  );
}

export default Button;