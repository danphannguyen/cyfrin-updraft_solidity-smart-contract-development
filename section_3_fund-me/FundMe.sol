// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    // Give access to all uint256 type to the function inside PriceConverter
    using PriceConverter for uint256;

    // uint256 public myValue = 1;
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping (address => uint256 amountFunded) public addressToAmountFunded;

    // "payable" keyword 
    function fund() public payable{
        

        // We need to use Oracles because msg.value is in ETH/GWei/Wei and minimumUsd is in USD
        require(msg.value.getConversionRate() >= minimumUsd, "didn't sed enough ETH"); // 1e18 = 1 ETH = 1 000 000 000 000 000 000 Wei = 1 * 10 ** 18
        
        // Adding the sender to the funders list
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        //for(starting index, ending index, step amout)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    }   
}

// Failed transaction will spend gas