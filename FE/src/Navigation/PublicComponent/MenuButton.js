import React, { useState } from 'react';
import styled, { css } from 'styled-components'

const List = styled.li`
  text-align: left;
`;

const Anchor = styled.a`
  display: block;
  padding: 6px 0 3px 15px;
  height: 28px;
`;

const Span = styled.span`
  float: left;
  font-size: 14px;

  ${props => 
    props.hover && 
    css`
      float: left;
      font-size: 14px;
      text-decoration: underline;
      font-weight: bold;
      color: #2ac1bc;
  `};
`;

const MenuButton = props => {
  const [isMouseEntered, setIsMouseEntered] = useState(false);

  const onMouseEntered = (e) => {
    e.preventDefault();
    setIsMouseEntered(true);
  }

  const onMouseLeaved = (e) => {
    e.preventDefault();
    setIsMouseEntered(false);
  }

  return (
    <List onMouseEnter={onMouseEntered.bind(this)} onMouseLeave={onMouseLeaved.bind(this)}>
    <Anchor href={props.url} hover={isMouseEntered}>
      <Span hover={isMouseEntered}>{props.title}</Span>
    </Anchor>
    </List>
  );
}

export default MenuButton;