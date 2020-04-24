import React, { useState, useEffect } from "react";
import Title from './PublicComponent/Title'
import Product from './PublicComponent/Product'
import styled from 'styled-components'
import fetchRequest from '../Util/fetchRequest'

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
      background: url(https://image.flaticon.com/icons/svg/126/126492.svg) no-repeat;
      background-size: 50px 100px;
    }

    &.slick-next {
      right: -80px;
      width: 50px;
      height: 100px;
      background: url(https://image.flaticon.com/icons/svg/126/126490.svg) no-repeat;
      background-size: 50px 100px;
    }

    &::before{
      display:none;
    }
  }
`;

const ProductBox = props => {
  const [productsData, setProductsData] = useState();

  return (
    <Div>
      {productsData !== undefined && 
        <>
        <Title main_title={productsData.category_name} sub_title={productsData.category_description}/>
        <DivProductList>
          <Slider
            slidesToShow={4}
            slidesToScroll={4}
            draggable={false}
          >
          {productsData.banchans.map((data, index) => <Product key={index} banchanData={data} category_id={productsData.category_id}/>)}
          </Slider>
        </DivProductList>
        </>
      }
    </Div>
  );
}

export default ProductBox;