const { deployProxy } = require("@openzeppelin/truffle-upgrades");

const ver1 = artifacts.require("TokenVer1");

module.exports = async function (_deployer) {
    const token = await deployProxy(ver1, { _deployer });
    console.log(`プロキシ コントラクトが ${token.address} にデプロイされました。`);
};
