import React from 'react';
import './Input100.css';

const Input100 = ({ value=0, onClick }) => {
  const handleClick = () => {
    if (value===0){
      onClick(100)
    }else
    if (value===100)
      onClick(0);
  };

  return (
    <div className="cartoonish-number" onClick={handleClick}>
      {value}
    </div>
  );
};

export default Input100;