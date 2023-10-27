// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;
pragma abicoder v2;

import {Test, console2, console} from "forge-std/Test.sol";
import {Quoter} from "../src/Quoter.sol";
import {IQuoter} from "../src/IQuoter.sol";

contract CounterTest is Test {
    uint256 mainnetFork;
    Quoter quoter;

    function setUp() public {
        mainnetFork = vm.createFork(vm.envString("MAINNET_RPC_URL"));
        vm.selectFork(mainnetFork);

        quoter = new Quoter(0x1F98431c8aD98523631AE4a59f267346ea31F984);
    }

    function testIncrement() public {
        IQuoter.QuoteExactInputSingleParams memory params = IQuoter.QuoteExactInputSingleParams({
            tokenIn: 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
            tokenOut: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            amountIn: 1000000000, // 1k
            fee: 500,
            sqrtPriceLimitX96: 0
        });

        (int256 amountReceived, uint160 sqrtPriceX96After) = quoter.quoteExactInputSingle(params);

        console2.log(amountReceived);
        console.log(sqrtPriceX96After);

        assertEq(true, true);
    }
}
