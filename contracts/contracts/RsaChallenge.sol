// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "./Groth16Verifier.sol";

contract RsaChallenge {
    address payable public owner;
    Groth16Verifier private verifier;

    uint256[5][] public liveness;

    uint256 public round;

    event Verified(uint256 round);

    constructor(address snarkVerifier) payable {
        verifier = Groth16Verifier(snarkVerifier);
        owner = payable(msg.sender);
        liveness[0][0] = 100;
        liveness[0][1] = 100;
        liveness[0][2] = 100;
        liveness[0][3] = 100;
        liveness[0][4] = 100;

    }

    function processRound(uint256[8] memory proof, uint256[15] memory _pubSignals) public {
        uint256[5] storage lastRound = liveness[round];
        //TODO: game finished?
        // require(assertion, "Game already concluded");

        uint256[2] memory pA = [proof[0], proof[1]];
        uint256[2][2] memory pB = [[proof[2], proof[3]], [proof[4], proof[5]]];
        uint256[2] memory pC = [proof[6], proof[7]];

        require(verifier.verifyProof(pA, pB, pC, _pubSignals), "Invalid proof");

        challengesCompleted[challenge] = msg.sender;
        emit Verified(msg.sender, challenge);
    }

}
