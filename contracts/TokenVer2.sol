// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";

contract TokenVer2 is ERC721EnumerableUpgradeable {
    string private constant _name = "Upgradable NFT (Version 2)";
    string private constant _symbol = "HELO";
    uint256 public constant version = 2;

    uint256 public id;

    receive() external payable {
        require(msg.value >= 1 ether, "Must pay no less than 1 ether");
        _mint(msg.sender, id++);
    }
}
