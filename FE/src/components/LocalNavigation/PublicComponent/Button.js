import React from 'react';
import styled from 'styled-components'

const Div = styled.div`
  float: left;
`;

const Anchor = styled.a`
  padding: 10px 10px 10px 10px;
  background: url(http://dev-angelo.dlinkddns.com/util_bar.gif) no-repeat;
  background-position: left;
`;

const Button = props => {
  return (
    <Div>
    <Anchor href={props.url}>{props.title}</Anchor>
    </Div>
  );
}

export default Button;