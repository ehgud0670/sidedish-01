import React from 'react';
import styled from 'styled-components'

const List = styled.div`
  position: relative;
  margin: 40px 0 32px;
  text-align: center;
`;

const H2 = styled.h2`
  color: #999;
  font-size: 18px;
  margin-bottom: 5px;
`;

const P = styled.p`
  font-size: 34px;
`;

const Title = props => {
  return (
    <List>
      <H2>{props.main_title}</H2>
      <P>{props.sub_title}</P>
    </List>
  );
};

export default Title;