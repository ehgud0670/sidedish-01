import React, { useEffect, useState } from 'react';
import './reset.css'
import LocalNavigation from './LocalNavigation/LocalNavigation';
import Header from './Header/Header'
import Navigation from './Navigation/Navigation'
import ProductBox from './ProductBox/ProductBox'
import fetchRequest from './Util/fetchRequest'

const App = () => {
  const [apiData, setAPIData] = useState();

  useEffect(() => {
    fetchRequest(process.env.REACT_APP_DB_TOTAL, "GET")
    .then((response) => response.json())
    .then((data) => {
      setAPIData(data.api);
    })
    .catch((error) => {
      alert("올바르지 못한 요청입니다.")
    });
  }, []);

  return (
    <>
    <LocalNavigation />
    <Header />
    <Navigation />
    {apiData !== undefined && 
      apiData.map((url, index) => <ProductBox key={index} url={url}/>)
    }
    </>
  );
}

export default App;
