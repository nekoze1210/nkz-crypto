// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "ERC721A/contracts/ERC721A.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import {console2} from "forge-std/Test.sol";

contract NkzNft is ERC721A, Ownable {
    using Strings for uint256;
    string public baseURI;
    string public metadataExtension = ".json";
    mapping(address => uint256[]) private _ownedTokens;

    constructor(string memory _name, string memory _symbol, string memory _baseURI) ERC721A(_name, _symbol) {
        baseURI = _baseURI;
    }

    function setMetadataExtension(string memory _newExtension) public onlyOwner {
        metadataExtension = _newExtension;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function mint(uint _quantity) external payable {
        uint256 _currentIndex = totalSupply();
        _mint(msg.sender, _quantity);
        for (uint i = _currentIndex; i < totalSupply(); i++) {
            _ownedTokens[msg.sender].push(i);
        }
    }

    function tokensOfOwner(address _owner) public view returns (uint256[] memory) {
        return _ownedTokens[_owner];
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseURI, tokenId.toString(), metadataExtension));
    }

    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }
}