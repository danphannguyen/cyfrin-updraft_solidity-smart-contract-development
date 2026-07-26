// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    // Give access to all uint256 type to the function inside PriceConverter
    using PriceConverter for uint256;

    // uint256 public myValue = 1;
    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping (address => uint256 amountFunded) public addressToAmountFunded;


    address public i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    // "payable" keyword 
    function fund() public payable{
        

        // We need to use Oracles because msg.value is in ETH/GWei/Wei and MINIMUM_USD is in USD
        require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't sed enough ETH"); // 1e18 = 1 ETH = 1 000 000 000 000 000 000 Wei = 1 * 10 ** 18
        
        // Adding the sender to the funders list
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        

        //for(starting index, ending index, step amout)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);

        // withdraw the funds
            // msg.sender = address type
            // payable(msg.sender) = payable address

            // transfer (2300 gas, throws error, if fail it would automatically revert)
            // payable(msg.sender).transfer(address(this).balance);

            // send (2300 gas, returns bool, if fail -> need "require()" to be reverted)
            // bool sendSuccess = payable(msg.sender).send(address(this).balance);
            // require(sendSuccess, "Send failed");

            // call (forward all gas or set gas, returns bool, if fail -> need "require()" to be reverted)
            // (bool callSuccess, bytes memory dataReturned)
            (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "Call failed");
    }   

    modifier onlyOwner() {
        // _; set when the function is executed
        // If we place it here, first we will execute withdraw THEN onlyOwner logic
        //require(msg.sender == i_owner, "You must be the owner");
        // We we place it here, it will execute onlyOwner THEN withdraw

        if(msg.sender != i_owner) { revert NotOwner(); }

        _;      
    }
}

// Failed transaction will spend gas

// Tips to brign down gas fee
// 1) 
//      Use Constant 
//          Consensus naming : full caps with _ (MINIMUM_USD)
//      Or Immutability 
//          (use when not set on the same line they declare, exemple constructor)
//          Consensus naming : low caps with i_ before (i_owner)

// 2) Use custom error instead of require() (like NotOwner error)