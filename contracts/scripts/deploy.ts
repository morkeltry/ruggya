import hre from "hardhat";
import { ethers } from "hardhat";


async function main() {
  const Verifier = await hre.ethers.getContractFactory("Groth16Verifier");
  console.log('deploying verifier');

  const verifier = await Verifier.deploy(
    {
      maxFeePerGas: (await ethers.provider.getFeeData()).maxFeePerGas
    }
  );
  await verifier.waitForDeployment();
  const Ruggya = await hre.ethers.getContractFactory("Ruggya");
  console.log('deploying Ruggya contract');

  const pubKeys = [
    "123456",
    "789012345",
    "67890123",
    "4567890123",
    "4567890123456789",
  ]
  const ruggya = await Ruggya.deploy(
    await verifier.getAddress(),
    pubKeys,
    {
      maxFeePerGas: (await ethers.provider.getFeeData()).maxFeePerGas
    }
  );
  await ruggya.waitForDeployment();

  console.log("Contract deployed to:", await ruggya.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });