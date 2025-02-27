const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();

module.exports = {
  networks: {
    sepolia: {
      provider: () => new HDWalletProvider(
        process.env.MNEMONIC,
        process.env.URL
      ),
      network_id: 11155111,  
      gas: 1000000,
      gasPrice: 1000000000000, 
      networkCheckTimeout: 10000,
      confirmations: 2,      
      timeoutBlocks: 200,    
      skipDryRun: true       
    },
  },
  compilers: {
    solc: {
      version: "0.8.20",     
    }
  }
};
