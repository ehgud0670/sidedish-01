import React, { useState, useEffect } from 'react';
import './Detail.css'
import fetchRequest from '../../utils/fetchRequest'

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
    <div className="detail-wrap">
      <div className="detail-contents">
      {banchanData === undefined && <img className="loadingImg" src="https://cdn.clipart.email/4b453b9d5509587f169c211be6908ca9_loading-gif-png-picture-654600-loading-gif-png_600-450.gif" alt="로딩 이미지"></img>}
      {banchanData !== undefined && 
        <>
        <button className="closeBtn" onClick={props.onCloseButtonClick}>X</button>
        <div className="image-area">
          <div className="current-image-area">
            <img className="current-image" src={banchanData.thumbs[0]} alt="현재 이미지"></img>
          </div>
          <ul className="image-list">
            {banchanData.thumbs.map((url, index) => <li key={index}><img className="ThumbImage" src={url} alt="썸네일 이미지"></img></li>)}
          </ul>
        </div>
        <div className="contents-area">
          <p className="banchan-title">[집밥의완성] 두부시래기조림 300g</p>
          <p className="banchan-description">{banchanData.description}</p>
          <div className="information">
            <p className="title">적립금</p>
            <p className="description">{banchanData.point}</p>
          </div>
          <div className="information">
            <p className="title">배송정보</p>
            <p className="description">{banchanData.delivery_info}</p>
          </div>
          <div className="information">
            <p className="title">배송비</p>
            <p className="description">{banchanData.delivery_fee}</p>
          </div>
          <div className="price-area">
            <p className="price">{banchanData.sale_price ? banchanData.sale_price.toLocaleString() : banchanData.normal_price.toLocaleString()}원</p>
          </div>
          <div className="amount-area">
            <p className="amount">수량</p>
            <input className="amount-number" type="number" value={amount} min="1" onChange={onAmountChanged}></input>
          </div>
          <div className="total-price-area">
            <p className="total-price">총 상품금액</p>
            <p className="price">{((banchanData.sale_price ? banchanData.sale_price : banchanData.normal_price)*amount).toLocaleString()}원</p>
          </div>
          <button className="addCartBtn" onClick={() => onAddCart(props.onCloseButtonClick)}>담기</button>
        </div>
        </>
      }
      </div>
    </div>
  );
};

export default Detail;