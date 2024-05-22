// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployRocher} from "../script/DeployRocher.s.sol";
import {Rocher} from "../src/Rocher.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {MintRocherNft} from "../script/Interactions.s.sol";

contract RocherTest is StdCheats, Test {
    string constant NFT_NAME = "Rocher";
    string constant NFT_SYMBOL = "RCH";
    Rocher public rocher;
    DeployRocher public deployer;
    address public deployerAddress;

    string public constant RCH_URI = "https://nft.icyfry.io/rch/1";
    address public constant USER = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

    function setUp() public {
        vm.prank(USER);
        deployer = new DeployRocher();
        rocher = deployer.runWithOwner(USER);
        assert(rocher.owner() == USER);
    }

    function testInitializedCorrectly() public view {
        assert(keccak256(abi.encodePacked(rocher.name())) == keccak256(abi.encodePacked((NFT_NAME))));
        assert(keccak256(abi.encodePacked(rocher.symbol())) == keccak256(abi.encodePacked((NFT_SYMBOL))));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        rocher.mintAll(USER);
        assert(rocher.balanceOf(USER) == 19);
    }

    function testTokenURIIsCorrect() public {
        vm.prank(USER);
        rocher.mintAll(USER);
        assert(keccak256(abi.encodePacked(rocher.tokenURI(1))) == keccak256(abi.encodePacked(RCH_URI)));
    }

    function testMintWithScript() public {
        vm.prank(USER);
        MintRocherNft mintRocherNft = new MintRocherNft();
        mintRocherNft.mintNftOnContract(address(rocher), USER);
        assert(rocher.balanceOf(USER) == 19);
    }
}
