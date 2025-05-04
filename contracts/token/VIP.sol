// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "../openzeppelin-contracts-5.0.0/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "../openzeppelin-contracts-5.0.0/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Permit} from "../openzeppelin-contracts-5.0.0/token/ERC20/extensions/ERC20Permit.sol";

contract VIP is ERC20, ERC20Burnable, ERC20Permit {
    constructor(address recipient) ERC20("VIP", "VIP") ERC20Permit("VIP") {
        _mint(recipient, 1812500000 * 10 ** decimals());
    }
} 