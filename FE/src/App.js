import React, { useEffect, useState } from 'react';
import './reset.css'
import LocalNavigation from './LocalNavigation/LocalNavigation';
import Header from './Header/Header'
import Navigation from './Navigation/Navigation'
import ProductBox from './ProductBox/ProductBox'
import fetchRequest from './Util/fetchRequest'
import Detail from './Detail/Detail'

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
  }, []);

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
