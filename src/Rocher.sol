// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Rocher is ERC721 {
    uint256 public constant COLLECTION_SIZE = 19;
    address public owner;

    constructor() ERC721("Rocher", "RCH") {
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
}
