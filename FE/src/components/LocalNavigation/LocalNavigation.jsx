import React, { useState, useEffect } from 'react';
import styled from 'styled-components'
import Button from './PublicComponent/Button'
import ListButton from './PublicComponent/ListButton'
import localNavigationData from './constants/localNavigationData'
import Cookies from 'universal-cookie';

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

const LocalNavigation = props => {
  const [appDownloadInfo, setAppDownloadInfo] = useState();
  const [commonMenuInfo, setCommonMenuInfo] = useState();
  const [user, setUser] = useState(props.user);
  const [currentVisibleIndex, setCurrentVisibleIndex] = useState(-1);

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

  const onLogoutBtnClicked = () => {
    const cookies = new Cookies();
    cookies.remove('user');
    setUser(undefined);
  }

  const onArrowBtnClicked = (key, visible) => {
    if (visible)
      setCurrentVisibleIndex(key);
    else
      setCurrentVisibleIndex(undefined);
  }


  return (
    <WrapDiv>
      <ContentDiv>
        {appDownloadInfo !== undefined && <ListButton key={0} id={0} title={appDownloadInfo.title} url={appDownloadInfo.url} list={appDownloadInfo.list} 
                                                      onArrowBtnClicked={onArrowBtnClicked} listVisible={currentVisibleIndex !== undefined ? 0 === currentVisibleIndex : false} />}
        <MenuDiv>
        {user ? <Button title={user + '님'}></Button> : 
                        <><Button title="로그인" url={process.env.REACT_APP_OAUTH}></Button><Button title="회원가입" url="#"></Button></>}
        {commonMenuInfo !== undefined && 
         commonMenuInfo.map((v, i) => (
           v.list === undefined ?  
            <Button key={i+1} id={i+1} title={v.title} url={v.url}/> : 
            <ListButton key={i+1} id={i+1} title={v.title} url={v.url} list={v.list} onArrowBtnClicked={onArrowBtnClicked} 
                        listVisible={currentVisibleIndex !== undefined ? i+1 === currentVisibleIndex : false}/>
            )
         )
        }
        {user && <Button title="로그아웃" url="#" onClick={onLogoutBtnClicked}></Button>}
        </MenuDiv>
      </ContentDiv>
    </WrapDiv>
  );
}

export default LocalNavigation;
