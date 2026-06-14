// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // solidity versions

contract SimpleStorage {
    uint256 myFavoriteNumber; 
    // By Default it's an internal value if you don't specify anything

    // uint256[] listOfFavoriteNumbers;

    // Custom Type
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // Custom type initialisation

        // You can add a limit to a list Person[3] 
        Person[] public listOfPeople;

        // Person public pat = Person({favoriteNumber: 7, name: "Pat"});
        // Person public mariah = Person({favoriteNumber: 29, name: "Mariah"});
        // Person public john = Person({favoriteNumber: 67, name: "John"});

        // link name to their favorite number, exemple : chelsea -> 123
        mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // View function is used to read data from the blockchain (doesn't need a transaction) and disallow updating state
    // Pure function is used to read data from the blockchain (same as View but disallow reading state)
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // calldata, memory, storage
    // calldata & memory are temporary stored within the function (but memory can be update, not calldata)
    // storage is for global function that live out of a function
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
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

// ========= GAS ==========

// GAS = How much gas are we sending (TC + EC)

// Transaction Cost 
// The real cost of the transaction

// Execution Cost 
// Only apply when a view or pure fonction is call by another function