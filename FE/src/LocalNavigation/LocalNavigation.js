import React, { useState, useEffect } from 'react';
import styled from 'styled-components'

import Button from './PublicComponent/Button'
import ListButton from './PublicComponent/ListButton'
import localNavigationData from '../MockData/LocalNavigationData'

const WrapDiv = styled.div`
  position: relative;
  border-bottom: 1px solid #f0f0f5
`;

const ContentDiv = styled.div`
  width: 980px;
  height: 36px;
  line-height: 36px;
  margin: 0 auto;
  position: relative;
`;

const LocalNavigation = () => {
  const [appDownloadInfo, setAppDownloadInfo] = useState();
  const [commonMenuInfo, setCommonMenuInfo] = useState();

  useEffect(() => {
    //These flow can be changed to get data from server by fetching.
    requestAppDownloadData()
      .then(
        setAppDownloadInfo(localNavigationData.download));

    requestLNBMenuData()
      .then(setCommonMenuInfo(localNavigationData.common));
  }, []);

  const requestAppDownloadData = () => {
    return new Promise(function(resolve, reject) {
      resolve(localNavigationData.download);
    });
  }

  const requestLNBMenuData = () => {
    return new Promise(function(resolve, reject) {
      resolve(localNavigationData.menu);
    });
  }

  return (
    <WrapDiv>
      <ContentDiv>
        {appDownloadInfo !== undefined && <ListButton title={appDownloadInfo.title} url={appDownloadInfo.url} list={appDownloadInfo.list}/>}
        {commonMenuInfo !== undefined && 
         commonMenuInfo.map((v, i) => (
           v.list === undefined ?  
            <Button key={i} title={v.title} url={v.url} direction="right" /> : 
            <ListButton key={i} title={v.title} url={v.url} list={v.list} direction="right" />
            )
         ).reverse()
        }
      </ContentDiv>
    </WrapDiv>
  );
}

export default LocalNavigation;
