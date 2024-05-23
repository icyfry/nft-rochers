// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {DeployRochers} from "../script/DeployRochers.s.sol";
import {Rochers} from "../src/Rochers.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {MintRochers} from "../script/Interactions.s.sol";

contract RocherTest is StdCheats, Test {
    string constant NFT_NAME = "Rochers";
    string constant NFT_SYMBOL = "RCH";
    Rochers public rochers;
    DeployRochers public deployer;
    address public deployerAddress;

    string public constant RCH_URI = "https://nft.icyfry.io/rch/1";
    address public constant USER = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

    function setUp() public {
        vm.prank(USER);
        deployer = new DeployRochers();
        rochers = deployer.runWithOwner(USER);
        assert(rochers.owner() == USER);
    }

    function testInitializedCorrectly() public view {
        assert(keccak256(abi.encodePacked(rochers.name())) == keccak256(abi.encodePacked((NFT_NAME))));
        assert(keccak256(abi.encodePacked(rochers.symbol())) == keccak256(abi.encodePacked((NFT_SYMBOL))));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        rochers.mintAll(USER);
        assert(rochers.balanceOf(USER) == 19);
    }

    function testTokenURIIsCorrect() public {
        vm.prank(USER);
        rochers.mintAll(USER);
        assert(keccak256(abi.encodePacked(rochers.tokenURI(1))) == keccak256(abi.encodePacked(RCH_URI)));
    }

    function testMintWithScript() public {
        vm.prank(USER);
        MintRochers mintRochers = new MintRochers();
        mintRochers.mintNftOnContract(address(rochers), USER);
        assert(rochers.balanceOf(USER) == 19);
    }
}
