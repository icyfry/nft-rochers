// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Rocher} from "../src/Rocher.sol";

contract MintRocherNft is Script {
    function run() external {
        address mostRecentlyDeployedBasicNft = DevOpsTools.get_most_recent_deployment("Rocher", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBasicNft, msg.sender);
    }

    function mintNftOnContract(address nftAddress, address user) public {
        vm.startBroadcast(user);
        console.logAddress(nftAddress);
        Rocher(nftAddress).mintAll(user);
        vm.stopBroadcast();
    }
}
