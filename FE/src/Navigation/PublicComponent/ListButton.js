import React, { useState } from 'react';
import styled, { css } from 'styled-components'
import MenuButton from './MenuButton'

const List = styled.li`
  float: left;
  position: relative;
  text-align: center;
`;

const Anchor = styled.a`
  line-height: 51px;
  padding: 13px 12px 18px;
  text-align: center;

  ${props => 
    props.hover && 
    css`
      background-color: white;
  `};
`;

const Span = styled.span`
  color: white;
  font-size: 14px;

  ${props => 
    props.hover && 
    css`
      color: #2ac1bc;
      font-size: 14px;
  `};
`;

const UnorderedList = styled.ul`
  position: absolute;
  width: 162px;
  padding: 20px 0 31px;
  display: none;

  ${props => 
    props.hover && 
    css`
      position: absolute;
      width: 162px;
      padding: 20px 0 31px;
      border-left: 1px solid black;
      border-right: 1px solid black;
      border-bottom: 1px solid black;
      display: block;
  `};
`;

const ListButton = props => {
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
      <UnorderedList hover={isMouseEntered}>
        {props.list !== undefined && 
         props.list.map((v, i) => (
           <MenuButton key={i} url={v.url} title={v.title}></MenuButton>
          )
         )
        }
      </UnorderedList>
    </List>
  );
}

export default ListButton;