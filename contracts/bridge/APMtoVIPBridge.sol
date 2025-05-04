// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC20} from "../openzeppelin-contracts-5.0.0/token/ERC20/IERC20.sol";
import {VIP} from "../token/VIP.sol";

contract APMToVIPBridge {
    IERC20 public immutable ERC20_APM = IERC20(0x8EB4029afd486f69e749ee172748582C2877aaAB);
    VIP public immutable VIP_TOKEN;
    
    constructor(address _vip) {
        VIP_TOKEN = VIP(_vip);
    }
    
    /**
     * @notice IMPORTANT: Only events after 32 confirmations are considered valid for bridge processing
     * 
     * @param senderERC20Address    Sender address on Ethereum
     * @param receiverBEP20Address  Receiver address on BSC
     * @param amount                Amount of APM
     */
    event Bridged(
        address indexed senderERC20Address,
        address indexed receiverBEP20Address, 
        uint256 amount
    );
    
    /**
     * @param receiverBEP20Address Receiver address on BSC
     */
    function bridge(address receiverBEP20Address) external {
        require(receiverBEP20Address != address(0), "Invalid BEP20 address");
        
        uint256 amount = ERC20_APM.balanceOf(msg.sender);
        require(amount > 0, "No APM balance");
        
        uint256 allowance = ERC20_APM.allowance(msg.sender, address(this));
        require(allowance >= amount, "Insufficient allowance");

        emit Bridged(msg.sender, receiverBEP20Address, amount);

        require(ERC20_APM.transferFrom(msg.sender, address(this), amount), "Transfer failed");
    }
} 