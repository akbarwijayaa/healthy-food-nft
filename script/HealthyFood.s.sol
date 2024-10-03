// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HealthyFood} from "../src/HealthyFood.sol";

contract HealthyFoodScript is Script {
    HealthyFood public healthyFood;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        healthyFood = new HealthyFood();

        vm.stopBroadcast();
    }
}
