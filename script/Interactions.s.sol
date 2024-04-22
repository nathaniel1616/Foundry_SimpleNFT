// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract Interactions is Script {
    BasicNFT basicNFT;
    string Pug_TokenURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDepolyed = DevOpsTools.get_most_recent_deployment(
            "BasicNFT",
            block.chainid
        );

        mintNFTOnContract(mostRecentlyDepolyed);
    }

    function mintNFTOnContract(address _NftContract) public {
        vm.startBroadcast();
        BasicNFT(_NftContract).mintNFT(Pug_TokenURI);
        vm.stopBroadcast();
    }
}
