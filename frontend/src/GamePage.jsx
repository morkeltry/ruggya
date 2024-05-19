import React, { useState } from 'react';
import './GamePage.css';
import CartoonishNumber from './CartoonishNumber';
import CartoonishNumberSpecial from './CartoonishNumberSpecial';

import character1 from './graphics/character1.jpg';
import character2 from './graphics/character2.jpg';
import character3 from './graphics/character3.jpg';
import character4 from './graphics/character4.jpg';
import character5 from './graphics/character5.jpg';

const characterImages = [character1, character2, character3, character4, character5];

const GamePage = ({ character, pubkey, cols = 8 }) => {
  const [inputsData, setInputsData] = useState(Array.from({ length: cols }, () => ''));
  
  const handleSignVote = () => {
    // Gather data from all input components
    const inputData = inputsData.map((data, index) => ({
      character: index + 1, // Character number
      data: data // Input data
    }));

    // Send data over WebSocket
    // Replace with your WebSocket logic
    console.log('Sending data:', inputData);
  };

  const handleInputChange = (index, value) => {
    // Update input data
    const newData = [...inputsData];
    newData[index] = value;
    setInputsData(newData);
  };

  const generateGrid = () => {
    let grid = [];
    for (let i = 0; i < 3; i++) {
      let row = [];
      for (let j = 0; j < cols; j++) {
        if (i === 0 && j === 0) {
          row.push(<div key={`${i}-${j}`} className="empty-cell"></div>);
        } else if (i === 0) {
          const image = characterImages[j % characterImages.length];
          row.push(
            <div key={`${i}-${j}`} className="top-row">
              <img src={image} alt="Character" className="character-image" />
            </div>
          );
        } else if (i >= 1 && j === 0) {
          row.push(
            <div key={`${i}-${j}`} className={`special-cell left-column`}>
              <CartoonishNumberSpecial />
            </div>
          );
        } else if (i === 2) {
          row.push(
            <div key={`${i}-${j}`} className={`hatched-cell ${j === 0 ? 'left-column' : ''}`}>
              <CartoonishNumber onChange={(value) => handleInputChange(j, value)} />
            </div>
          );
        } else {
          row.push(
            <div key={`${i}-${j}`} className={`grid-cell ${j === 0 ? 'left-column' : ''}`}>
              <CartoonishNumber onChange={(value) => handleInputChange(j, value)} />
            </div>
          );
        }
      }
      grid.push(<div key={i} className="grid-row">{row}</div>);
    }
    return grid;
  };
  

  return (
    <div className="game-page">
      <div className="grid-container" style={{ '--cols': cols }}>
        {generateGrid()}
      </div>
      <button className="sign-vote-button" onClick={handleSignVote}>Sign and Vote</button>
    </div>
  );
};

export default GamePage;
