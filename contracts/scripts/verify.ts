import hre from "hardhat";
import { ethers } from "hardhat";
// @ts-ignore
import * as snarkjs from 'snarkjs';

import * as inputs from "../../circuits/inputState.json";

import * as proof from "../../circuits/proof.json";
import * as publicSignals from "../../circuits/public.json";

const ruggyaAddress = "0xF67e26649037695DdFAB19f4E22d5c9Fd1564592";
async function main() {

  const PK = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";
  const wallet = new ethers.Wallet(PK);

// Optionally, connect the wallet to a provider
const signer = wallet.connect(hre.ethers.provider);

  const ruggya = (await hre.ethers.getContractAt("Ruggya", ruggyaAddress))
    .connect(signer);

  console.log("await ruggya.owner()", await ruggya.owner())
  console.log("await signer.address",  signer.address)

  // const {proof} = await snarkjs.groth16.prove(
  //   "../../circuits/setup/state_transition_0001.zkey",
  //   "../../circuits/state_transition_js/witness.wtns",  
  // );

  console.log('Sending proof');
  // const proof = res.proof
  const tx = await ruggya.processRound(
    [
      "100",
      "100",
      "100",
      "100",
      "100",
      "123456",
      "789012345",
      "67890123",
      "4567890123",
      "4567890123456789",
      "100",
      "100",
      "100",
      "100",
      "100",
      "100",
      "100",
      "100",
      "100",
      "100",
      "123456",
      "789012345",
      "67890123",
      "4567890123",
      "4567890123456789"
     ],
    ["0", "100", "100", "100", "100"],
    [proof.pi_a[0], proof.pi_a[1], proof.pi_b[0][1], proof.pi_b[0][0], proof.pi_b[1][1], proof.pi_b[1][0], proof.pi_c[0], proof.pi_c[1]]
  );

  console.log(`Transaction ID: ${tx.hash}`);
  await tx.wait();
  console.log('waited enough');

  //      maxFeePerGas: (await ethers.provider.getFeeData()).maxFeePerGas
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });