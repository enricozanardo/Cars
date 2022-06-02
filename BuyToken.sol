// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BuyToken is ERC20 {

    uint256 initialSupply = 250 ether;
   constructor() ERC20("BuyToken","BUY") {
       _mint(msg.sender, initialSupply);

    }
}

