// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {Rocher} from "../src/Rocher.sol";
import {console} from "forge-std/console.sol";

contract DeployRocher is Script {
    function run() external returns (Rocher) {
        return runWithOwner(msg.sender);
    }

    function runWithOwner(address user) public returns (Rocher) {
        vm.startBroadcast(user);
        Rocher rocher = new Rocher();
        vm.stopBroadcast();
        return rocher;
    }
}
