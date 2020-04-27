import React, { useState, useEffect } from "react";
import Title from './PublicComponent/Title'
import Product from './PublicComponent/Product'
import styled, { keyframes } from 'styled-components'
import fetchRequest from '../../utils/fetchRequest'

import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Slider from "react-slick";

const Div = styled.div`
  position: relative;
  overflow: hidden;
  padding-bottom: 40px;
`;

const DivProductList = styled.div`
  width: 980px;
  margin: 0 auto;

  .slick-arrow {
    width: 50px;
    height: 100px;
    background-color: blue;

    &.slick-prev {
      left: -80px;
      width: 50px;
      height: 100px;
      background: url(http://dev-angelo.dlinkddns.com/prev.svg) no-repeat;
      background-size: 50px 100px;
    }

    &.slick-next {
      right: -80px;
      width: 50px;
      height: 100px;
      background: url(http://dev-angelo.dlinkddns.com/next.svg) no-repeat;
      background-size: 50px 100px;
    }

    &::before{
      display:none;
    }
  }
`;

const load5 = keyframes`
  0%,
  100% {
    box-shadow:0em -2.6em 0em 0em #000000, 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2), 2.5em 0em 0 0em rgba(0, 0, 0, 0.2), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.2), 0em 2.5em 0 0em rgba(0, 0, 0, 0.2), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.2), -2.6em 0em 0 0em rgba(0, 0, 0, 0.5), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.7);
  }
  12.5% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.7), 1.8em -1.8em 0 0em #000000, 2.5em 0em 0 0em rgba(0, 0, 0, 0.2), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.2), 0em 2.5em 0 0em rgba(0, 0, 0, 0.2), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.2), -2.6em 0em 0 0em rgba(0, 0, 0, 0.2), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.5);
  }
  25% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.5), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.7), 2.5em 0em 0 0em #000000, 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.2), 0em 2.5em 0 0em rgba(0, 0, 0, 0.2), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.2), -2.6em 0em 0 0em rgba(0, 0, 0, 0.2), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2);
  }
  37.5% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.2), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.5), 2.5em 0em 0 0em rgba(0, 0, 0, 0.7), 1.75em 1.75em 0 0em #000000, 0em 2.5em 0 0em rgba(0, 0, 0, 0.2), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.2), -2.6em 0em 0 0em rgba(0, 0, 0, 0.2), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2);
  }
  50% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.2), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2), 2.5em 0em 0 0em rgba(0, 0, 0, 0.5), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.7), 0em 2.5em 0 0em #000000, -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.2), -2.6em 0em 0 0em rgba(0, 0, 0, 0.2), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2);
  }
  62.5% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.2), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2), 2.5em 0em 0 0em rgba(0, 0, 0, 0.2), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.5), 0em 2.5em 0 0em rgba(0, 0, 0, 0.7), -1.8em 1.8em 0 0em #000000, -2.6em 0em 0 0em rgba(0, 0, 0, 0.2), -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2);
  }
  75% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.2), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2), 2.5em 0em 0 0em rgba(0, 0, 0, 0.2), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.2), 0em 2.5em 0 0em rgba(0, 0, 0, 0.5), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.7), -2.6em 0em 0 0em #000000, -1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2);
  }
  87.5% {
    box-shadow: 0em -2.6em 0em 0em rgba(0, 0, 0, 0.2), 1.8em -1.8em 0 0em rgba(0, 0, 0, 0.2), 2.5em 0em 0 0em rgba(0, 0, 0, 0.2), 1.75em 1.75em 0 0em rgba(0, 0, 0, 0.2), 0em 2.5em 0 0em rgba(0, 0, 0, 0.2), -1.8em 1.8em 0 0em rgba(0, 0, 0, 0.5), -2.6em 0em 0 0em rgba(0, 0, 0, 0.7), -1.8em -1.8em 0 0em #000000;
  }
`;

const Loader = styled.div`
  margin: 180px auto;
  font-size: 14px;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  vertical-align: middle;
  position: relative;
  text-indent: -9999em;
  -webkit-animation: ${load5} 1.1s infinite ease;
  animation: ${load5} 1.1s infinite ease;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
`;

const ProductBox = props => {
  const [productsData, setProductsData] = useState();

  useEffect(() => {
    fetchRequest(props.url, "GET")
    .then((response) => response.json())
    .then(({data}) => {
      setProductsData(data);
    })
    .catch((error) => {
      alert("올바르지 못한 요청입니다.")
    });
  }, [props.url]);

  return (
    <Div>
      {productsData === undefined && <Loader></Loader>}
      {productsData !== undefined && 
      <>
      <Title main_title={productsData.category_name} sub_title={productsData.category_description}/>
      <DivProductList>
        <Slider
          slidesToShow={4}
          slidesToScroll={4}
          draggable={false}
        >
        {productsData.banchans.map((data, index) => <Product key={index} banchanData={data} category_id={productsData.category_id} onProductClick={props.onProductClick}/>)}
        </Slider>
      </DivProductList>
      </>
      }
    </Div>
  );
}

export default ProductBox;