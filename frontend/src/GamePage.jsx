import React, { useState } from 'react';
import './GamePage.css';
import Input100 from './Input100';
import Input100Leftover from './Input100Leftover';

import character1 from './graphics/character1.jpg';
import character2 from './graphics/character2.jpg';
import character3 from './graphics/character3.jpg';
import character4 from './graphics/character4.jpg';
import character5 from './graphics/character5.jpg';

const characterImages = [character1, character2, character3, character4, character5];

const GamePage = ({ character, pubkey, cols = 8 }) => {
  const [PublicVoteData, setPublicVoteData] = useState(Array.from({ length: cols }, () => 0));
  const [secretVoteData, setSecretVoteData] = useState(Array.from({ length: cols }, () => 0));

  const handleSignVote = () => {
    // Gather data from all input components
    const PublicVoteInputData = PublicVoteData.map((data, index) => ({
      character: index + 1, // Character number
      data: data // Input data
    }));

    const secretVoteInputData = secretVoteData.map((data, index) => ({
      character: index + 1, // Character number
      data: data // Input data
    }));

    // Send data over WebSocket
    // Replace with your WebSocket logic
    console.log('Submitting PublicVoteData:', PublicVoteInputData);
    console.log('Submitting secretVoteData:', secretVoteInputData);
  };

  const handlePublicVoteClick = (index, newValue) => {
    const newData =
        (newValue===100)
            ? Array.from({ length: cols }).fill(0) 
            : [...PublicVoteData];
    newData[index] = newValue;
    setPublicVoteData(newData);
  };

  const handleSecretVoteClick = (index, newValue) => {
    const newData = [...secretVoteData];
    newData[index] = newValue;
    setSecretVoteData(newData);
  };

  const generateGrid = (data, handleClick) => {
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
        } else {
          const inputRow = i === 1 ? PublicVoteData : secretVoteData;
          const cellClassName = j === 0 ? `special-cell left-column` : `grid-cell ${i === 2 ? 'hatched-cell' : ''}`;
          row.push(
            <div key={`${i}-${j}`} className={cellClassName}>
              <Input100
                value={inputRow[j]}
                onClick={(newValue) => i === 1 ? handlePublicVoteClick(j, newValue) : handleSecretVoteClick(j, newValue)}
              />
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
