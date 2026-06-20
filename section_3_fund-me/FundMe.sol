// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract FundMe {

    // uint256 public myValue = 1;
    uint256 public minimumUsd = 5;

    // "payable" keyword 
    function fund() public payable{
        // Allow users to send $
        // Have a minimum $ sent
        // 1. How do we send ETH to this contract? (require set the minimum)
        // myValue = myValue + 2;

        // We need to use Oracles because msg.value is in ETH/GWei/Wei and minimumUsd is in USD
        require(msg.value > minimumUsd, "didn't sed enough ETH"); // 1e18 = 1 ETH = 1 000 000 000 000 000 000 Wei = 1 * 10 ** 18

        // What is a revert
        // Undo any actions that have been done, and send the remaining gas back
    }

    function withdraw() public {}
}

// Failed transaction will spend gas