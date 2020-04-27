import React, { useState } from 'react';
import styled, { css } from 'styled-components'
import MenuButton from './MenuButton'

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
  background: url(https://web.archive.org/web/20190123203014im_/https://cdn.bmf.kr/web/common/util_bar.gif) no-repeat;
  background-position: left;

  &:hover {
    color: #2ac1bc;
  }
`;

const UnorderedList = styled.ul`
  position: absolute;
  border: 1px solid black;
  display: none;
  z-index: 1;
  background-color: white;

  ${props => 
    props.inverted && 
    css`
      display: block;
  `};
`;

const List = styled.li`
  width: 164px;
  height: 30px;
  line-height: 30px;
`;

const ListButton = props => {
  const [listVisible, setListVisible] = useState(false);
  const {title, url, list} = props;
  const listTemplate = list.map((v, i) => 
  <List key={i}><MenuButton url={v.url} title={v.title}></MenuButton></List>
  );

  const test = (e) => {
    e.preventDefault();
    setListVisible(!listVisible);
  }

  return (
    <Div direction={props.direction}>
      <Anchor href={url} onClick={test.bind(this)}>{title} ▼</Anchor>
      <UnorderedList inverted={listVisible}>
        {listTemplate}
      </UnorderedList>
    </Div>
  );
}

export default ListButton;