const { upgradeProxy } = require("@openzeppelin/truffle-upgrades");

const ver1 = artifacts.require("TokenVer1");
const ver2 = artifacts.require("TokenVer2");

module.exports = async function (_deployer) {
    throw "このステップは実行しません。";

    console.log(`プロキシ コントラクト ${ver1.address} に対して、アップグレードを行います。`);
    await upgradeProxy(ver1.address, ver2, { _deployer });
    console.log("アップグレードが完了しました。");
};
