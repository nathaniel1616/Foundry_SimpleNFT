// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract BasicNFT_Test is Test {
    DeployBasicNFT deployBasicNFT;
    BasicNFT basicNFT;
    address USER = makeAddr("USER");
    string Pug_TokenURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    string constant NFT_NAME = "Dogie";
    string constant NFT_SYMBOL = "Dog";

    function setUp() external {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.run();
    }

    function test_NFTNameIsDogie() public view {
        console.log("name of nft: ", basicNFT.name());
        console.log("nft adddress is ", address(basicNFT));
        assertEq(basicNFT.name(), NFT_NAME);
    }

    function test_FuzzNFTNameIsDogie(string memory x) public view {
        console.log("name of nft: ", basicNFT.name());
        console.log("nft adddress is ", address(basicNFT));
        // assertEq(basicNFT.name(), NFT_NAME);

        string memory nftName = basicNFT.name();

        assert(
            keccak256(abi.encodePacked((x))) !=
                keccak256(abi.encodePacked((nftName)))
        );
    }

    function test_CanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(Pug_TokenURI);

        assertEq(basicNFT.balanceOf(USER), 1);
        assertEq(Pug_TokenURI, basicNFT.tokenURI(0));
        assert(
            keccak256(abi.encodePacked(Pug_TokenURI)) ==
                keccak256(abi.encodePacked(basicNFT.tokenURI(0)))
        );
    }
}
