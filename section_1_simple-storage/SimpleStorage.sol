// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // solidity versions

contract SimpleStorage {
    uint256 favoriteNumber; 

}

// ========= DOCS ==========

// Basic Types: boolean, uint, int, address, bytes
    // bool hasFavoriteNumber = true;
        // Default Value : False

    // string favoriteNumberInText = "Eighty Eight"; 
        // string are bytes object specifically for text
        // Default Value : ""

    // uint256 favoriteNumberUInt = 88; 
        // uint256 = uint (it helps define the memory space needed)
        // Default Value : 0

    // int256 favoriteNumberInt = -88; 
        // int vs uint (int can be negative)
        // Default Value : 0

    // address myAddress = 0x3636363636363636363636363636363636363636; 
        // address can be a wallet address
        // Default Value : 0x0000000000000000000000000000000000000000

    // bytes32 favoriteBytes32 = "cat"; 
        // bytes32 is a fixed size array of bytes
        // Default value : ""