# Ruggy-a

(It's like Mafia)
A multiplayer selective infornmatoin disclosure game,
repo based on https://github.com/Cardinal-Cryptography/zk-dapp-template


## Who's involved?
#### The gamesmaster
- a non-playing relayer who initialises and maintains the game state, including everyones' secrets. The gamesmaster is needed to run the game without MPC / FHE as zero knowledge proofs geenrally require some party (the gamesmaster here) to submit the entirity of the secret state for proving.

#### The Maffya
- Players who look like every other player, who are known to each other and collude out-of-band to exercise their secret powers (2X rug vote). The Maffya aim to be the last two players standing. They are 'on the same team' and will never have advantage in not cooperating.

#### The Bagholders
- Players with (in this iteration) no special powers. Their aim is to kill (rug) the Maffya - but how to know who the Maffya are ???

#### Special Power Bagholders
- Not yet implemented but special powers can include: vote neutralisation, rug-proofing, bag-pumping

## Data structure
STATE:
|                  |   p1   |   p2   |   p3   |   p4   |   p5   |
|:--------------------:|:------:|:------:|:------:|:------:|:------:|
|     aliveness (L)    | {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} |
| public vote power (P)|  100%  |  100%  |  100%  |  100%  |  100%  |
| secret vote power (S)| 0% OR 100% | 0% OR 100% | 0% OR 100% | 0% OR 100% | 0% OR 100% |
| pubkey | felt | felt | felt | felt | felt |

VOTES (per player) :
|                    |   p1   |   p2   |   p3   |   p4   |   p5   |
|:----------------------:|:------:|:------:|:------:|:------:|:------:|
| public rug against (KP)| {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} |
| secret rug against (KS)| {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} | {0% - 100%} |
<tr>
  <td colspan="6" align="center">signature</td>
</tr>


STATE TRANSITION CONSTRAINTS:
. For each player pn:
. Sum (1<=v<=5, KPnv) <= Pn
. Sum (1<=v<=5, SPnv) <= Sn
. Vote is signed

Constraints can be added where other roles are permitted, so long as they can be expressed as vector arithmetic on elements in these data structures.



## Components

- `/circuits` circuit written in circom language
- `/contracts` Solidity smart contract for on-chain circuit verification
- `/frontend` React frontend, submitting zero-knowledge proofs to smart contract

## Usage

1. Run `npm install`.
2. Put private key for deployment account in `contracts/hardhat.config.ts` - IF delopying on a non-local network
3. From root directory, execute `npm run deploy` to deploy smart contracts on-chain. You will get contract address.
4. Put contract address in `frontend/src/RsaChallengeComponent.tsx`. Execute `npm run start`.
