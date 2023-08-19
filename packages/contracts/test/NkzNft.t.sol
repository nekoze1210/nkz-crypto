// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {NkzNft} from "../src/NkzNft.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract NkzNftTest is Test {
    using Strings for uint256;

    NkzNft public nkzNft;
    string private name = "NkzNft";
    string private symbol = "NKZ";
    string private baseURI = "https://example.com/";

    function setUp() public {
        nkzNft = new NkzNft(name, symbol, baseURI);
    }

    function testMetadata() public {
        assertEq(nkzNft.name(), name);
        assertEq(nkzNft.symbol(), symbol);
        assertEq(nkzNft.baseURI(), baseURI);
    }

    function testMint() public {
        nkzNft.setIsRevealed(true);
        address someRandomUser = vm.addr(1);
        vm.prank(someRandomUser);
        vm.deal(someRandomUser, 1 ether);
        nkzNft.mint(1);
        assertEq(nkzNft.totalSupply(), 1);
        assertEq(nkzNft.ownerOf(1), someRandomUser);
        assertEq(nkzNft.balanceOf(someRandomUser), 1);
        assertEq(nkzNft.tokenURI(1), string(abi.encodePacked(baseURI, "1", nkzNft.metadataExtension())));
    }

    function testMultipleMint() public {
        nkzNft.setIsRevealed(true);
        address someRandomUser = vm.addr(1);
        vm.prank(someRandomUser);
        vm.deal(someRandomUser, 1 ether);
        uint256 mintAmount = 100;
        nkzNft.mint(mintAmount);
        assertEq(nkzNft.totalSupply(), mintAmount);
        assertEq(nkzNft.balanceOf(someRandomUser), mintAmount);

        uint256 startTokenId = 1;
        for (uint256 i = startTokenId; i <= 100; i++) {
            assertEq(nkzNft.tokenURI(i), string(abi.encodePacked(baseURI, i.toString(), nkzNft.metadataExtension())));
            assertEq(nkzNft.ownerOf(i), someRandomUser);
        }
    }

    function testSetMetadataExtension() public {
        string memory newExt = ".new.json";
        nkzNft.setMetadataExtension(newExt);
        assertEq(nkzNft.metadataExtension(), newExt);
    }

    function testSetBaseURI() public {
        nkzNft.setBaseURI("https://newexample.com/");
        assertEq(nkzNft.baseURI(), "https://newexample.com/");
    }
}
