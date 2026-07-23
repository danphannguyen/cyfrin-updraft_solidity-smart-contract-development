// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts@1.5.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// Define "library" to create a library
// All function needs to be internal
library PriceConverter {

    function getPrice() internal view returns (uint256) {
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
    
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
            uint256 ethPrice = getPrice();

            // It always better to multiply first and divid after, to avoid having "1 / 2 = 0"
            uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
            return ethAmountInUSD;
    }

    function getVersion() internal view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}