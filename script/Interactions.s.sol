// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Rochers} from "../src/Rochers.sol";

contract MintRochers is Script {
    function run() external {
        address mostRecentlyDeployedNft = DevOpsTools.get_most_recent_deployment("Rochers", block.chainid);
        mintNftOnContract(mostRecentlyDeployedNft, msg.sender);
    }

    function mintNftOnContract(address nftAddress, address user) public {
        vm.startBroadcast(user);
        // console.logAddress(nftAddress);
        Rochers(nftAddress).mintAll(user);
        vm.stopBroadcast();
    }
}
