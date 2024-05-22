# Who's rugging who?

(It's like [Mafia](https://en.wikipedia.org/wiki/Mafia_(party_game)))
A multiplayer selective information disclosure game,
repo based on https://github.com/Cardinal-Cryptography/zk-dapp-template

## The story
Who's rugging who is a story of no rules 21st century high finance. AKA crypto.
The big players own so many stakes in each other, all opaque and unregulated - we don't know which of them are colluding, or who pose a systemic risk. Even the benevolent government's saintly regulators are not keeping order as they claim, but playing their own nihilistic agenda.
Everybody says to be looking out for the little people but somewhere in their interlocked system of perverse incentives, some of the players are secretly colluding to pump their bags by risking toppling the whole crypto ecosystem. They are *The Maffya*.

## Who's involved?
#### The gamesmaster
- a non-playing relayer who initialises and maintains the game state, including everyones' secrets. The gamesmaster is needed to run the game without MPC / FHE as zero knowledge proofs geenrally require some party (the gamesmaster here) to submit the entirity of the secret state for proving.

#### The Maffya
- Players who look like every other player, who are known to each other and collude out-of-band to exercise their secret powers (2X rug vote). The Maffya aim to be the last two players standing. They are 'on the same team' and will never have advantage in not cooperating.

#### The Bagholders
- Players with (in this iteration) no special powers. Their aim is to kill (rug) the Maffya - but how to know who the Maffya are ???

#### Special Power Bagholders
- Not yet implemented but special powers can include: vote neutralisation, rug-proofing, bag-pumping

## Gameplay
After registration and before the game starts, players are allocated a character. To prevent real-life coercion, this stage is the only point at which a player can find out whether or not they are Maffya. Clicking 'Show Special Powers' will either reveal a modal, with special powers, or will do nothing. This is the ONLY time at which the Maffya status or otherwise is available in frontend state.

When the game starts, all players, asynchronously, have the chance to vote to rug another (or more then one) player. (Currently the frontend is set to vote only 100%, but nothing prevents this from being changed to allocate partial votes to different players.
The top row is the public vote that the relayer can reveal to all parties after the round. The lower row is the secret vote which only Maffya can use.
All players can enter any votes in the frontend (because the Maffya / non-Maffya status of players is not available to prevent coercion) but if a non-Maffya player tries to enter a secret vote, it will be rejected by the relayer. Similarly, if the player changes the DOM to give themselves more than their allocated voting power.
The relayer cannot ovverride this constraint, since fulfillment of the constraints is proved in circom and the resulting proof verified in the smart contract.

Game logic is calculated in the relayer, which has a full view into state. There is no way without MPC or FHE, to avoid some trusted party having a view into state. However, the relayer can only view and potentially censor, it cannot manipulate game moves or their results.

The new game state is sent back to the frontends by websocket, and receipt of the message triggers update of the new game state in the frontend ready for another round (or game over).

Future work would be to add circuits to verify the fairness of initial game state (equal distribution of votes, etc.), and to add alternative games circuits including roles such as 'Campaign Donor' that can affect other variables than liveness, eg Campaign Donor could censor a chosen player's vote.



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

______________________


STATE TRANSITION CONSTRAINTS:
* For each player pn:
* Sum (1<=v<=5, KPnv) <= Pn
* Sum (1<=v<=5, SPnv) <= Sn
* Vote is signed

Constraints can be added where other roles are permitted, so long as they can be expressed as vector arithmetic on elements in these data structures.

TODO: KNOWN MISSING CONSTRAINTS:
* KPnv, KSnv >= 0   for all (n,v) !         (no negative votes)
* KPnv equal (100)  for all (n,v)           (everyone has public vote power)
* KSnv equal for each n, for all v          (for each player, the player has the same voting power against all players)

## Components

- `/circuits` circuit written in circom language
- `/contracts` Solidity smart contract for on-chain circuit verification
- `/frontend` React frontend, submitting zero-knowledge proofs to smart contract


## Setup
```
### Install circom
git clone https://github.com/iden3/circom.git
cd circom/
cargo build --release
cargo install --path circom
circom --help
```


```
circom state_transition.circom --r1cs --wasm --sym --c
cd state_transition_js
node generate_witness.js state_transition.wasm ../inputState.json witness.wtns
cd ..
```


```
mkdir setup && cd setup

npx snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
npx snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="Towers of Pow" -v
npx snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

npx snarkjs groth16 setup ../state_transition.r1cs pot12_final.ptau state_transition_0000.zkey
npx snarkjs zkey contribute state_transition_0000.zkey state_transition_0001.zkey --name="Werewolf Will" -v
npx snarkjs zkey export verificationkey state_transition_0001.zkey verification_key.json
cd ..

```

WEIRD HACK WE HAVEN'T YET GOT A BETTER WAY TO DO

`code ../node_modules/ffjavascript/build/main.cjs`
and at L4975 replace the lines 
>        const nPoints = Math.floor(buffBases.byteLength / sGIn);
>        const sScalar = Math.floor(buffScalars.byteLength / nPoints);
with
>        const nPoints = Math.floor(buffBases.byteLength / sGIn);
>        if (nPoints == 0) return G.zero; // added new here
>        const sScalar = Math.floor(buffScalars.byteLength / nPoints);



INPUT SPECIFIC USAGE

```
npx snarkjs groth16 prove setup/state_transition_0001.zkey state_transition_js/witness.wtns proof.json public.json
```

## Usage - play

1. Run `npm install`.
2. `cd relayer && npm run start`
3. (in another terminal) `cd frontend && npm run start`


## Usage - redelpoy
1. Put private key for deployment account in `contracts/hardhat.config.ts` - IF delopying on a non-local network
2. From root directory, execute `npm run deploy` to deploy smart contracts on-chain. You will get contract address.
3. (TODO : implement relayer contract interactions)
