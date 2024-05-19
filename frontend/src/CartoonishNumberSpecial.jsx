import React from 'react';

const CartoonishNumberSpecial = ({ value, onClick, onKeyDown, onBlur, onChange }) => {
  return (
    <input
      type="text"
      value={value}
      onClick={onClick}
      onKeyDown={onKeyDown}
      onBlur={onBlur}
      onChange={onChange}
      placeholder="0"
      maxLength="3" // Limit input to 3 characters
      className="cartoonish-number-special"
    />
  );
};

export default CartoonishNumberSpecial;