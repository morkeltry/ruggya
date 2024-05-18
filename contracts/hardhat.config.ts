import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  defaultNetwork: "localhost",
  namedAccounts: {
    deployer: {
      // By default, it will take the first Hardhat account as the deployer
      default: 0,
    },
  },
  // networks: {
  //   sepolia: {
  //     url: 'https://rpc.ankr.com/eth_sepolia',
  //     accounts: [''], //put your deployment private key here
  //   }
  // }
};

export default config;
