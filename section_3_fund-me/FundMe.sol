// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts@1.5.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    // uint256 public myValue = 1;
    uint256 public minimumUsd = 5e18;

    // "payable" keyword 
    function fund() public payable{
        // Allow users to send $
        // Have a minimum $ sent
        // 1. How do we send ETH to this contract? (require set the minimum)
        // myValue = myValue + 2;

        // We need to use Oracles because msg.value is in ETH/GWei/Wei and minimumUsd is in USD
        require(getConversionRate(msg.value) > minimumUsd, "didn't sed enough ETH"); // 1e18 = 1 ETH = 1 000 000 000 000 000 000 Wei = 1 * 10 ** 18

        // What is a revert
        // Undo any actions that have been done, and send the remaining gas back
    }

    // function withdraw() public {}
    function getPrice() public view returns (uint256) {
        // Instanciate the contrat with the interface and the oracle adress to help our IDE with functions he don't know(ETH/USD on Sepolia)
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        
        // Call the oracle function latestRoundData()
        // We can also write : (,int256 price,,,) = priceFeed.latestRoundData();
        (
            /* uint80 roundID */,
            int256 price,
            /* uint startedAt */,
            /* uint timeStamp */,
            /* uint80 answeredInRound */
        ) = priceFeed.latestRoundData();
        
        // 3. The price is return with 8 decimals. Msg.value with 18 decimals (Wei).
        // Multiply by 1e10 to get 18 decimals in total and convert in uint256.
        return uint256(price * 1e10);
    }
        function getConversionRate(uint256 ethAmount) public view returns(uint256) {
            uint256 ethPrice = getPrice();

            // It always better to multiply first and divid after, to avoid having "1 / 2 = 0"
            uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
            return ethAmountInUSD;
        }
    }

// Failed transaction will spend gas