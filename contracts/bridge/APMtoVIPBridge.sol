// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC20} from "../openzeppelin-contracts-v5.0/contracts/token/ERC20/IERC20.sol";

contract APMToVIPBridge {
    IERC20 public immutable apmToken = IERC20(0x8EB4029afd486f69e749ee172748582C2877aaAB);
    
    event Bridged(address indexed sender, address indexed bep20Address, uint256 amount);
    
    function bridge(address bep20Address) external {
        uint256 amount = apmToken.balanceOf(msg.sender);
        require(amount > 0, "No APM balance");
        require(bep20Address != address(0), "Invalid BEP20 address");
        require(apmToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        emit Bridged(msg.sender, bep20Address, amount);
    }
}
