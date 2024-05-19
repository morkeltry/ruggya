// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import "./Groth16Verifier.sol";

contract Ruggya {
    address payable public owner;
    Groth16Verifier private verifier;

    uint256[5] public pubKeys;
    uint256[5][] public life;

    uint256 public round;
    bool public ended;

    event Verified(uint256 round);
    event Ended(uint256 round);

    constructor(address _verifier, uint256[5] memory _pubKeys) payable {
        verifier = Groth16Verifier(_verifier);
        owner = payable(msg.sender);

        life.push([uint256(100), 100, 100, 100, 100]);
        pubKeys = _pubKeys;
    }

    function processRound(
        uint256[25] memory _pubSignals,
        uint256[5] memory _livenessOut, 
        uint256[8] memory _proof
    ) public {
        require(!ended, "Game already ended");
        uint256[5] storage lastRound = life[round];

        uint256[5] memory livenessIn;
        uint256[5] memory pubKeysIn;
        for (uint256 i = 0; i < 5; i++) {
            livenessIn[i] = _pubSignals[i];
            pubKeysIn[i] = _pubSignals[5 + i];
        }

        require(areArraysIdentical(livenessIn, lastRound), "Starting liveness mismatch");
        require(areArraysIdentical(pubKeysIn, pubKeys), "Public keys mismatch");

        uint256[2] memory pA = [_proof[0], _proof[1]];
        uint256[2][2] memory pB = [[_proof[2], _proof[3]], [_proof[4], _proof[5]]];
        uint256[2] memory pC = [_proof[6], _proof[7]];

        require(verifier.verifyProof(pA, pB, pC, _pubSignals), "Invalid proof");

        round++;
        life.push(_livenessOut);
        
        emit Verified(round);

        isFinished();
    }

    function isFinished() private {
        if (false) {
            ended = true;
            emit Ended(round);
        }
    }

    function areArraysIdentical(uint256[5] memory a, uint256[5] memory b) internal pure returns (bool) {
        for (uint256 i = 0; i < 5; i++) {
            if (a[i] != b[i]) return false;
        }
        return true;
    }
}