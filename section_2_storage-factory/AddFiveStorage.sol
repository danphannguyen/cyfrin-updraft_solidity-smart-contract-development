// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// We want to make this contract a child of SImpleStorage contact
import { SimpleStorage } from "./SimpleStorage.sol";

// in our case "is" = "extends"
contract AddFiveStorage is SimpleStorage {

    // We want to overrides our store function to add +5 
    // Keywords are : "virtual", "override"
    // add "virtual" to the parent function and "override" to the child function
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}