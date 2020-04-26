import React, { useState, useEffect } from 'react';
import styled from 'styled-components'
import './Detail.css'
import fetchRequest from '../Util/fetchRequest'

const Detail = props => {
  const banchanId = props.banchanId;
  const [banchanData, setBanchanData] = useState();

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
  }, []);

  const onNumberChanged = () => {

  }

  return (
    <div className="DetailWrap">
      {banchanData === undefined && <img src="https://cdn.clipart.email/4b453b9d5509587f169c211be6908ca9_loading-gif-png-picture-654600-loading-gif-png_600-450.gif"></img>}
      {banchanData !== undefined && 
      <div className="DetailContents">
        <button className="CloseButton" onClick={props.onCloseButtonClick}>X</button>
        <div className="ImageArea">
          <div className="CurrentImage">
            <img className="Image"></img>
          </div>
          <ul className="ImageList">
            {banchanData.thumbs.map((url, index) => <li><img className="ThumbImage" src={url}></img></li>)}
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
          <div className="PriceArea"><p className="Price">{banchanData.normal_price.toLocaleString()}원</p></div>
          <div className="AmountArea">
            <p className="Amount">수량</p>
            <input className="AmountNumber" type="number" step="1" min="1" value="1" onChange={onNumberChanged}></input>
          </div>
        </div>
      </div>
      }
    </div>
  );
};

export default Detail;