const handleWs = (socket, pubkey, setGameData) => {

    socket.onopen = () => console.log('WebSocket connected');

    socket.onmessage = (event) => {
        console.log (event, event.data);
        switch (event) {
            case 'REQUEST_PUBKEY':
              console.log('REQUEST_PUBKEY');
              socket.send({pubkey});
              console.log('pubkey sent.');
            case 'WAITING':
              console.log('WAITING');
            // case '':
            //   console.log('');
            default: {
                const data = JSON.parse(event.data);

                switch (data.messageType) {
                    case 'RESPOND_SELF': 

                    
                    case 'RESPOND_GAME_STATE': 


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

export default handleWs;