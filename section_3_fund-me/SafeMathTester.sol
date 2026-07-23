// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SafeMathTester {
    uint8 public bigNumber = 255; // unchecked

    // Before solidity 8.X.X, if go beyond the limit of a type we go back to the lowest value
    // uint8 : max = 255, 255+1 = 0 
    // That's why we use SafeMath who check if we can go beyond before adding
    // In Solidity 8.X.X, you can still do this by using "unchecked" key word
    function add() public {
        bigNumber = bigNumber + 1;
        // unchecked {bigNumber = bigNumber +1;}
    }
}