# Ruggy-a

(It's like Mafia)
A multiplayer selective infornmatoin disclosure game,
repo based on https://github.com/Cardinal-Cryptography/zk-dapp-template



## Components

- `/circuits` circuit written in circom language
- `/contracts` Solidity smart contract for on-chain circuit verification
- `/frontend` React frontend, submitting zero-knowledge proofs to smart contract

## Usage

1. Run `npm install`.
2. Put private key for deployment account in `contracts/hardhat.config.ts` - IF delopying on a non-local network
3. From root directory, execute `npm run deploy` to deploy smart contracts on-chain. You will get contract address.
4. Put contract address in `frontend/src/RsaChallengeComponent.tsx`. Execute `npm run start`.
