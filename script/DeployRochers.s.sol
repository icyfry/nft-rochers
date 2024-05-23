// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {Rochers} from "../src/Rochers.sol";
import {console} from "forge-std/console.sol";

contract DeployRochers is Script {
    function run() external returns (Rochers) {
        return runWithOwner(msg.sender);
    }

    function runWithOwner(address user) public returns (Rochers) {
        vm.startBroadcast(user);
        Rochers rochers = new Rochers();
        vm.stopBroadcast();
        return rochers;
    }
}
