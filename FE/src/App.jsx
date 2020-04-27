import React, { useEffect, useState } from 'react';
import './lib/style/reset.css'
import LocalNavigation from './components/LocalNavigation/LocalNavigation';
import Header from './components/Header/Header'
import Navigation from './components/Navigation/Navigation'
import ProductBox from './components/ProductBox/ProductBox'
import Detail from './components/Detail/Detail'
import fetchRequest from './util/fetchRequest'

const App = () => {
  const [apiData, setAPIData] = useState();
  const [modalVisible, setModalVisible] = useState(false);
  const [banchanId, setBanchanId] = useState("");
  
  const onProductClick = banchanId => {
    setBanchanId(banchanId);
    setModalVisible(true);
  }

  const onCloseButtonClick = () => {
    setModalVisible(false);
  }

  useEffect(() => {
    if (apiData === undefined) {
      fetchRequest(process.env.REACT_APP_DB_TOTAL, "GET")
      .then((response) => response.json())
      .then((apiData) => {
        setAPIData(apiData.data);
      })
      .catch((error) => {
        alert("올바르지 못한 요청입니다.")
      });
    }
  });

  return (
    <>
    <LocalNavigation />
    <Header />
    <Navigation />
    {apiData !== undefined && 
      apiData.map((url, index) => <ProductBox key={index} url={url} onProductClick={onProductClick}/>)
    }
    {modalVisible && <Detail onCloseButtonClick={onCloseButtonClick} banchanId={banchanId}/>}
    </>
  );
}

export default App;
