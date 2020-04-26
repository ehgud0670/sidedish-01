import React from 'react';
import styled from 'styled-components'

const Div = styled.div`
  position: relative;
  float: left;
  width: 215px;
  border-radius: 50%;
  margin-left: 15px;
`;

const Anchor = styled.a`
`;

const ImageDiv = styled.div`
  position: relative;
  width: 215px;
  height: 215px;
  background: url(${props => props.image}) no-repeat center;
  background-size: contain;
  border-radius: 50%;
`;

const DefinitionDelivery = styled.div`
  text-align: center;
  position: absolute;
  top: 0px;
  left: 0px;
  width: 215px;
  height: 215px;
  border-radius: 50%;
  color: transparent;
  text-align: center;
  font-size: 24px;
  z-index: 1;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  align-items: center;
  text-align: center;

  &:hover {
    color: white;
    background-color: rgba(34,34,34,0.8);
  }
`;

const DeliveryWrap = styled.div`
  width: 100%;
  height: 60%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  align-items: center;
  text-align: center;
`;


const Delivery = styled.div`
  display: inline-block;
  width: 100%;
  text-align: center;
  font-size: 24px;
  margin: 0 auto;
`;

const Image = styled.img`
`;

const Title = styled.p`
  width: 100%;
  padding-top: 20px;
  font-size: 16px;
  overflow: hidden;
  text-overflow: ellipsis;
  font-weight: bold;
  white-space: nowrap;
  text-align: center;
`;

const Description = styled.p`
  width: 100%;
  font-size: 13px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  color: #666;
  text-align: center;
`;

const DefinitionDescription = styled.dd`
  text-align: center;
`;

const NormalPrice = styled.div`
  display: inline-block;
  font-size: 14px;
  color: gray;
  text-align: center;
  font-weight: bold;
  margin-left: 5px;
  margin-right: 5px;
  text-decoration: line-through;
`;

const SellingPrice = styled.div`
  display: inline-block;
  font-size: 26px;
  color: #2ac1bc;
  text-align: center;
  font-weight: bold;
  margin-left: 5px;
  margin-right: 5px;
`;

const Product = props => {
  const banchanId = props.banchanData.banchan_id;

  const onProductClick = e => {
    e.preventDefault();
    props.onProductClick(banchanId);
  }

  return (
    <Div>
      <Anchor href="#" onClick={onProductClick}>
        <DefinitionDelivery>
          <DeliveryWrap>
            {props.banchanData.delivery_types.map((data, index) => <Delivery className="delivery" key={index}>{data}</Delivery>)}
          </DeliveryWrap>
        </DefinitionDelivery>
        <ImageDiv image={props.banchanData.image}/>
        <Title>{props.banchanData.title}</Title>
        <Description>{props.banchanData.description}</Description>
        <DefinitionDescription>
          {props.banchanData.sale_price === null ?  
          <SellingPrice>{props.banchanData.normal_price.toLocaleString()}원</SellingPrice> : 
          <>
          <SellingPrice>{props.banchanData.normal_price.toLocaleString()}원</SellingPrice>
          <NormalPrice>{props.banchanData.normal_price.toLocaleString()}</NormalPrice>
          </>
          }
        </DefinitionDescription>
      </Anchor>
    </Div>
  );
};

export default Product;