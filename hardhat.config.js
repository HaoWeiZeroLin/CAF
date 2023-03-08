/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('@nomiclabs/hardhat-waffle');
require('dotenv').config();

module.exports = {
  solidity: "0.8.9",
  networks: {
    Goerli: {
      url: `${process.env.POKT_Goerli_URL}`,
      accounts: [`${process.env.Goerli_PRIVATE_KEY}`],
    } 
  }
};
