// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Rochers is ERC721 {
    uint256 public constant COLLECTION_SIZE = 19;
    address public owner;

    constructor() ERC721("Rochers", "RCH") {
        owner = msg.sender;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://nft.icyfry.io/rch/";
    }

    function mintAll(address to) public {
        require(msg.sender == owner, "Only owner can mint");
        for (uint256 i = 1; i <= COLLECTION_SIZE; i++) {
            _safeMint(to, i);
        }
    }

    function totalSupply() public pure returns (uint256) {
        return COLLECTION_SIZE;
    }
}
