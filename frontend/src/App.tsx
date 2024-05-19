import React, { useState, useEffect } from 'react';
import './App.css'; // Ensure you have appropriate CSS for centering and styles
import Spinner from './Spinner'; // Assume this is a spinner component you have created or imported
import Character1 from './graphics/character1.jpg';
import Character2 from './graphics/character2.jpg';
import Character3 from './graphics/character3.jpg';
import Character4 from './graphics/character4.jpg';
import Character5 from './graphics/character5.jpg';
import GamePage from './GamePage'; // Assume this is your game page component

const characters = [Character1, Character2, Character3, Character4, Character5];

const App = () => {
  // page = 'register' | 'waiting' | 'character' | 'game' 
  const [page, setPage] = useState('register');
  const [ws, setWs] = useState(null);
  const [playerNumber, setPlayerNumber] = useState(1);
  const [showModal, setShowModal] = useState(false);
  const [pubkey, setPubkey] = useState('your-public-key'); // Example public key

  useEffect(() => {
    if (page === 'register') {
      const socket = new WebSocket('wss://127.0.0.1:3000');
      socket.onopen = () => console.log('WebSocket connected');
      socket.onmessage = (event) => {
        const data = JSON.parse(event.data);
        setPlayerNumber(data.playerNumber);
        setPage('character');
      };
      // setWs(socket);

      return () => {
        socket.close();
      };
    }
  }, [page]);

  const handleRegister = () => {
    setPage('waiting');
  };

  const handleSeePowers = () => {
    setShowModal(true);
    setTimeout(() => {
      setShowModal(false);
    }, 3000);
  };

  const handleNextPage = () => {
    setPage('game');
  };

  return (
    <div className="app">
      {page === 'register' && (
        <div className="centered">
          <div onClick={handleRegister} className="register-button">Register</div>
        </div>
      )}

      {page === 'waiting' && (
        <div className="centered">
          <Spinner />
        </div>
      )}

      {page === 'character' && playerNumber !== null && (
        <div className="centered">
          <img src={characters[playerNumber - 1]} className="character-image" alt={`Character ${playerNumber}`} />
          <button onClick={handleSeePowers} className="red-button">See Special Powers</button>
          <div className="green-arrow" onClick={handleNextPage}>&#x2192;</div>
          {showModal && (
            <div className="modal">
              <div className="modal-content">
                <p>Special Power 1</p>
                <p>Special Power 2</p>
                <p>Special Power 3</p>
              </div>
            </div>
          )}
        </div>
      )}

      {page === 'game' && (
        <GamePage character={characters[playerNumber - 1]} pubkey={pubkey} />
      )}
    </div>
  );
};

export default App;