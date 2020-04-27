import React from 'react';
import styled from 'styled-components'
import ImageButton from './PublicComponent/ImageButton'
import SearchBar from './PublicComponent/SearchBar'

const WrapDiv = styled.div`
  position: relative;
`;

const HeaderDiv = styled.div`
  width: 980px;
  height: 98px;
  line-height: 36px;
  margin: 0 auto;
  position: relative;
`;


const Header = () => {
  return (
    <WrapDiv>
      <HeaderDiv>
        <ImageButton imageUrl="http://dev-angelo.dlinkddns.com/bmc-logo.png" url="#" imageDescription="배민찬 로고" />
        <SearchBar />
        <ImageButton imageUrl="http://dev-angelo.dlinkddns.com/code-squad.png" url="#" imageDescription="코드스쿼드 로고" direction="right" />
      </HeaderDiv>
    </WrapDiv>
  );
}

export default Header;