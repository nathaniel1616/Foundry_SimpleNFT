// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {BasicNFT} from "../src/BasicNFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployBasicNFT is Script {
    BasicNFT basicNFT;

    string constant NFT_NAME = "Dogie";
    string constant NFT_SYMBOL = "Dog";

    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        basicNFT = new BasicNFT(NFT_NAME, NFT_SYMBOL);
        vm.stopBroadcast();
        return (basicNFT);
    }
}
