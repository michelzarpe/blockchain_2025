require('dotenv').config();
const HDWalletProvier = require('@truffle/hdwallet-provider')

module.exports = {
  networks: {
    bsctest:{
      provider: new HDWalletProvier({
        mnemonic: {
          phrase: process.env.SECRET

        }
      }),
      providerOrUrl: " rpc url",
      network_id: "97"
    }
  },
  compilers: {
    solc: {
      version: "^0.8.17",
      settings: {
        optimizer: {
          enabled: true, // Default: false
          runs: 200      // Default: 200
        },
      }
    }
  }
};
