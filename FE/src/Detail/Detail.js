import React, { useState, useEffect } from 'react';
import styled from 'styled-components'
import './Detail.css'
import fetchRequest from '../Util/fetchRequest'

const Detail = props => {
  const banchanId = props.banchanId;
  const [banchanData, setBanchanData] = useState();
  const [amount, setAmount] = useState(1);

  useEffect(() => {
    if (banchanData === undefined) {
      fetchRequest(process.env.REACT_APP_DB_BANCHAN + banchanId, "GET")
      .then((response) => response.json())
      .then((apiData) => {
        setBanchanData(apiData.data);
      })
      .catch((error) => {
        alert("올바르지 못한 요청입니다.")
      });
    }
  });

  const onAmountChanged = e => {
    setAmount(e.target.value);
  }

  const onAddCart = modalCloseCallback => {
    alert("제품을 장바구니에 담았습니다.");
    modalCloseCallback();
  }

  return (
    <div className="DetailWrap">
      {banchanData === undefined && <img src="https://cdn.clipart.email/4b453b9d5509587f169c211be6908ca9_loading-gif-png-picture-654600-loading-gif-png_600-450.gif"></img>}
      {banchanData !== undefined && 
      <div className="DetailContents">
        <button className="CloseButton" onClick={props.onCloseButtonClick}>X</button>
        <div className="ImageArea">
          <div className="CurrentImage">
            <img className="Image" src={banchanData.thumbs[0]}></img>
          </div>
          <ul className="ImageList">
            {banchanData.thumbs.map((url, index) => <li key={index}><img className="ThumbImage" src={url}></img></li>)}
          </ul>
        </div>
        <div className="ContentsArea">
          <p className="BanchanTitle">[집밥의완성] 두부시래기조림 300g</p>
          <p className="BanchanDescription">{banchanData.description}</p>
          <div className="Information">
            <p className="Title">적립금</p>
            <p className="Description">{banchanData.point}</p>
          </div>
          <div className="Information">
            <p className="Title">배송정보</p>
            <p className="Description">{banchanData.delivery_info}</p>
          </div>
          <div className="Information">
            <p className="Title">배송비</p>
            <p className="Description">{banchanData.delivery_fee}</p>
          </div>
          <div className="PriceArea">
            <p className="Price">{banchanData.sale_price ? banchanData.sale_price.toLocaleString() : banchanData.normal_price.toLocaleString()}원</p>
          </div>
          <div className="AmountArea">
            <p className="Amount">수량</p>
            <input className="AmountNumber" type="number" value={amount} min="1" onChange={onAmountChanged}></input>
          </div>
          <div className="TotalPriceArea">
            <p className="TotalPrice">총 상품금액</p>
            <p className="Price">{((banchanData.sale_price ? banchanData.sale_price : banchanData.normal_price)*amount).toLocaleString()}원</p>
          </div>
          <button className="AddCartBtn" onClick={() => onAddCart(props.onCloseButtonClick)}>담기</button>
        </div>
      </div>
      }
    </div>
  );
};

export default Detail;