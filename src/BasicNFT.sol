// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 s_counter;
    mapping(uint256 tokenId => string tokenURI) private s_tokenIdToUri;

    //         "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        s_counter = 0;
    }

    function mintNFT(string memory _tokenURI) public {
        s_tokenIdToUri[s_counter] = _tokenURI;

        _safeMint(msg.sender, s_counter);

        s_counter++;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[_tokenId];
    }

    // getter function
}
