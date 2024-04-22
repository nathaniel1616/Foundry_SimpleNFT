// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {MintBasicNft} from "../script/Interactions.s.sol";

contract InteractionTest is Test {
    DeployBasicNFT deployBasicNFT;
    BasicNFT basicNFT;
    MintBasicNft mintBasicNft;
    address USER = makeAddr("USER");
    string Pug_TokenURI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() external {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.run();
        mintBasicNft = new MintBasicNft();
        // interactions.mintNFTOnContract(address(basicNFT));
    }

    function test_InteractionMintedandHasBalance() public {
        mintBasicNft.mintNFTOnContract(address(basicNFT));
        assert(basicNFT.balanceOf(msg.sender) == 1);
        assert(keccak256(abi.encodePacked(basicNFT.tokenURI(0))) == keccak256(abi.encodePacked(Pug_TokenURI)));
    }
}
