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
  const [ws, setWs] = useState({send: msg => 'ws not ready'});
  const [playerNumber, setPlayerNumber] = useState(-1);
  const [character, setCharacter] = useState("");
  const [selfLiveness, setSelfLiveness] = useState(-1);
  const [gameState, setGameState] = useState({});
  const [gameLiveness, setGameLiveness] = useState(null);
  const [gamePublicVotingPower, setGamePublicVotingPower] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [pubkey, setPubkey] = useState((Math.floor(Math.random()*1000000)).toString()); // Example public key

  useEffect(() => {
    if (page === 'register') {
      //set up ws:// connection on register page, it should be maintained until end of game.
      const socket = new WebSocket('ws://127.0.0.1:4444');
      handleWs(socket);

    
    }
  }, [page]);

  const handleWs = socket => {
    setWs(socket);

    socket.onopen = () => console.log('WebSocket connected');

    socket.onmessage = (event) => {
        console.log (event, event.data);
        switch (event.data) {
            case 'REQUEST_PUBKEY':
              console.log('REQUEST_PUBKEY');
              socket.send(JSON.stringify({pubkey}));
              console.log('pubkey sent.');
            break;
            case 'WAITING':
              console.log('WAITING');
            // case '':
            //   console.log('');
            break;
            default: {
                console.log("Got WS data that's probably JSON");
                console.log(event.data);
                const data = JSON.parse(event.data);

                switch (data.messageType) {
                    case 'RESPOND_SELF': 
                      setPlayerNumber(data.self.player);
                      setCharacter(data.self.character);
                      setSelfLiveness(data.self.liveness);
                      // lastRoundMoved;
                      // lastMove;
                    break;
                    case 'RESPOND_GAME_STATE': 
                      setPlayerNumber(data.self.player);
                      setCharacter(data.self.character);
                      setSelfLiveness(data.self.liveness);
                      setGameLiveness(data.gameState.map (player=>player.liveness));
                      setGamePublicVotingPower(data.gameState.map (player=>player.publicVotingPower));

                  



                    break;
                    case 'RESPOND_SHOW_POWERS': 
                      handleSeePowers(data.powers);
                    break;
                    default:


                    break
                     
                }
                // setPlayerNumber(data.playerNumber);
                // setPage('character');
            }
        }
    };
    
    return () => {
        socket.close();
    };
  }

  const handleRegister = () => {
    if (ws.send) ws.send(JSON.stringify({
      ready : true,
      pubkey    
    }));
    setPage('waiting');
  };

  const handleSeePowers = (powers) => {
    setShowModal(powers);
    setTimeout(() => {
      setShowModal(false);
    }, 3000);
  };

  const handleNextPage = () => {
    if (gameLiveness && gamePublicVotingPower) {
      setPage('game');
    } else {
      ws.send('REQUEST_GAME_STATE')
    }
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
        <GamePage character={characters[playerNumber - 1]} pubkey={pubkey} socket={ws} gameState={gameState}/>
      )}
    </div>
  );
};

export default App;