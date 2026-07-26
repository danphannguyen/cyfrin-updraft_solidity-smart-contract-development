// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FallbackExemple {
    uint256 public result;

    // Default function when receive transaction WITHOUT DATA
    receive() external payable {
        result = 1;
    }

    // Default function when receive transaction WITH DATA (but no known function)
    fallback() external payable {
        result = 2;
    }
    //Explainer from : https://solidity-by-example.org/fallback/
}