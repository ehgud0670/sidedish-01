import React from 'react';
import styled from 'styled-components'

const Anchor = styled.a`
  padding: 6px 10px 7px 12px;

  &:hover {
    color: #2ac1bc;
    text-decoration: underline;
    font-weight: bold;
  }
`;

const MenuButton = props => {
  return (
    <>
      <Anchor href={props.url}>{props.title}</Anchor>
    </>
  );
}

export default MenuButton;