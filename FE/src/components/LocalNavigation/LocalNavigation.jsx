import React, { useState, useEffect } from 'react';
import styled from 'styled-components'
import Button from './PublicComponent/Button'
import ListButton from './PublicComponent/ListButton'
import localNavigationData from './constants/localNavigationData'

const WrapDiv = styled.div`
  position: relative;
  border-bottom: 1px solid #f0f0f5;
`;

const ContentDiv = styled.div`
  width: 980px;
  height: 36px;
  line-height: 36px;
  margin: 0 auto;
  position: relative;
`;

const MenuDiv = styled.div`
  float: right;
`;

const LocalNavigation = () => {
  const [appDownloadInfo, setAppDownloadInfo] = useState();
  const [commonMenuInfo, setCommonMenuInfo] = useState();

  useEffect(() => {
    requestAppDownloadData(localNavigationData.download)
      .then(resultData => setAppDownloadInfo(resultData));

    requestLNBMenuData(localNavigationData.common)
      .then(resultData => setCommonMenuInfo(resultData));
  }, []);

  const requestAppDownloadData = (downloadData) => {
    return new Promise(function(resolve, reject) {
      if (downloadData)
        resolve(downloadData);
      else
        reject("데이터가 존재하지 않습니다.");
    });
  }

  const requestLNBMenuData = (commonData) => {
    return new Promise(function(resolve, reject) {
      if (commonData)
        resolve(commonData);
      else
        reject("데이터가 존재하지 않습니다.");
    });
  }

  return (
    <WrapDiv>
      <ContentDiv>
        {appDownloadInfo !== undefined && <ListButton title={appDownloadInfo.title} url={appDownloadInfo.url} list={appDownloadInfo.list}/>}
        <MenuDiv>
        {commonMenuInfo !== undefined && 
         commonMenuInfo.map((v, i) => (
           v.list === undefined ?  
            <Button key={i} title={v.title} url={v.url}/> : 
            <ListButton key={i} title={v.title} url={v.url} list={v.list}/>
            )
         )
        }
        </MenuDiv>
      </ContentDiv>
    </WrapDiv>
  );
}

export default LocalNavigation;
