import React from 'react';
import styled from 'styled-components'
import MenuButton from './MenuButton'

const List = styled.li`
  float: left;
  position: relative;
  text-align: center;

  &:hover {
    ul {
      display: block;
    }

    a {
      background-color: white;

      .nav_listBtn_title {
        color: #2ac1bc;
        font-size: 14px;
      }
    }
  }
`;

const Anchor = styled.a`
  line-height: 51px;
  padding: 13px 12px 18px;
  text-align: center;

  &:hover {
    span {
      color: #2ac1bc;
      font-size: 14px;
    }
  }
`;

const Span = styled.span`
  color: white;
  font-size: 14px;
`;

const UnorderedList = styled.ul`
  position: absolute;
  width: 162px;
  padding: 20px 0 31px;
  border-left: 1px solid black;
  border-right: 1px solid black;
  border-bottom: 1px solid black;
  display: none;
  z-index: 2;
  background-color: white;
`;

const ListButton = props => {
  return (
    <List>
      <Anchor href={props.url}>
        <Span className="nav_listBtn_title">{props.title}</Span>
      </Anchor>
      <UnorderedList>
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