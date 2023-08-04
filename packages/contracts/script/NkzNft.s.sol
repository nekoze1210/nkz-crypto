// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import "../src/NkzNft.sol";

contract NkzNftScript is Script {
    function setuUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory baseURI = vm.envString("BASE_URI");

        vm.startBroadcast(deployerPrivateKey);

        new NkzNft("NKZ NFT", "NKZ", baseURI);

        vm.stopBroadcast();
    }
}
