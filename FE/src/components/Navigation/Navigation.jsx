import React, { useEffect, useState } from 'react';
import styled from 'styled-components'
import ListButton from './PublicComponent/ListButton'
import navigationData from './constants/NavigationData'

const NavigationWrapDiv = styled.div`
  position: relative;
  background: #483f35;
`;

const NavigationDiv = styled.nav`
  width: 980px;
  height: 52px;
  margin: 0 auto;
`;

const NavigationListDiv = styled.div`
  position: relative;
`;

const Navigation = () => {
  const [menuInfo, setMenuInfo] = useState();

  useEffect(() => {
    //These flow can be changed to get data from server by fetching.
    requestAppDownloadData()
      .then(
        setMenuInfo(navigationData));
  }, []);

  const requestAppDownloadData = () => {
    return new Promise(function(resolve, reject) {
      resolve(navigationData);
    });
  }

  return (
    <NavigationWrapDiv>
      <NavigationDiv>
        <NavigationListDiv>
        {menuInfo !== undefined && 
         menuInfo.map((v, i) => (
           <ListButton key={i} url="#" title={v.title} list={v.list}></ListButton>
          )
         )
        }
        </NavigationListDiv>
      </NavigationDiv>
    </NavigationWrapDiv>
  );
}

export default Navigation;