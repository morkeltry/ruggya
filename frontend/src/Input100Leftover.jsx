import React from 'react';
import './Input100Leftover.css';

const Input100Leftover = ({ value }) => {
  return (
    <div className="leftover-number">
    {/* {value}  */}
      {value !== 0 && value}
    </div>
  );
};

export default Input100Leftover;