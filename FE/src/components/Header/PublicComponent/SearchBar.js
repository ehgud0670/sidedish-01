import React from 'react';
import styled from 'styled-components'

const WrapDiv = styled.div`
  position: relative;
  float: left;
  margin: 30px 0 0 46px;
`;

const Input = styled.input`
  width: 210px;
  height: 38px;
  padding: 0 38px 0 15px;
  border: 1px solid #cfd0d2;
`;

//<form name="search" className="searchbar"><input type="text" name="search-str" id="search-str"></input></form>

const SearchBar = props => {
  return (
    <WrapDiv>
      <Input>
      </Input>
    </WrapDiv>
  );
};

export default SearchBar;