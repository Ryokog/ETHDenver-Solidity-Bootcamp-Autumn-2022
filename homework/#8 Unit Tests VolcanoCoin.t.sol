// Homework 8
// Using your choice of hardhat, foundry or truffle
// 1. Create a project for your Volcano coin
// . Write unit tests for your Volcano coin contract
// The tests should show that
// 1. The total supply is initially 10000
// . That the total supply can be increased in 1000 token steps
// . Only the owner of the contract can increase the supply.
// For help with the syntax for unit tests see
// Hardhat : https://hardhat.org/guides/waffle-testing.html
// Foundry : https://book.getfoundry.sh/forge/tests
// Truffle : https://trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript.html
// You can use the gitpod workspace :
// gitpod.io/#https://github.com/ExtropyIO/SolidityBootcamp

// Unit Tests for VolcanoCoin.sol
// I chose Foundry for the test purpose to practice writing in Solidity more

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../VolcanoCoin.sol";
import "forge-std/Test.sol";


contract VolcanoCoinContractTest is Test {
    // I took line 10 from some online material. What is it doing?
    address public owner;
    VolcanoCoin public volcanoCoin;

    function setUp() public {
        owner = msg.sender;
        volcanoCoin = new VolcanoCoin();
    }
   
    function testInitialTotalSupply()   {
        // I want to test my initial total supply and yet I am calling totaly supply...
        assertEq(volcanoCoin.getTotalSupply(), 10_000);
    }

    function testSupplyIncrease() {
        assertEq(volcanoCoin.supplyIncrease(owner), 11_000);
    }
   

}

// I am still working on this test
