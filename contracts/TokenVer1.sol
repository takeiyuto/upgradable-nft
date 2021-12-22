// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";

contract TokenVer1 is ERC721EnumerableUpgradeable {
    string private constant _name = "Upgradable NFT";
    string private constant _symbol = "HELO";
    uint256 public constant version = 1;

    function initialize() public initializer {
        __ERC721_init(_name, _symbol);
    }

    uint256 public id;

    receive() external payable {
        _mint(msg.sender, id++);
    }
}
