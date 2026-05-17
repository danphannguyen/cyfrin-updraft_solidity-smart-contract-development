// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // solidity versions

contract SimpleStorage {
    //Basic Types: boolean, uint, int, address, bytes

    bool hasFavoriteNumber = true;
    uint256 favoriteNumberUInt = 88; //uint256 = uint (it helps define the memory space needed)
    string favoriteNumberInText = "Eighty Eight"; // string are bytes object specifically for text
    int256 favoriteNumberInt = -88; //int vs uint (int can be negative)
    address myAddress = 0x3636363636363636363636363636363636363636; //address can be a wallet address
    bytes32 favoriteBytes32 = "cat"; // bytes32 is a fixed size array of bytes

}