// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC20} from "../openzeppelin-contracts-5.0.0/token/ERC20/IERC20.sol";

contract TokenBridge {
    IERC20 public immutable sourceToken;
    
    constructor(address _sourceToken) {
        require(_sourceToken != address(0), "Invalid token address");
        sourceToken = IERC20(_sourceToken);
    }

    /**
     * @notice IMPORTANT: Only events after 32 confirmations are considered valid for bridge processing
     * 
     * @param senderERC20Address    Sender address on Ethereum
     * @param receiverBEP20Address  Receiver address on BSC
     * @param amount                Amount of sourceToken
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
        
        uint256 amount = sourceToken.balanceOf(msg.sender);
        require(amount > 0, "No token balance");
        
        uint256 allowance = sourceToken.allowance(msg.sender, address(this));
        require(allowance >= amount, "Insufficient allowance");

        require(sourceToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        
        emit Bridged(msg.sender, receiverBEP20Address, amount);
    }
} 