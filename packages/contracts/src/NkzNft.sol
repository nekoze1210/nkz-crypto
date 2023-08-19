// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "ERC721A/contracts/ERC721A.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract NkzNft is ERC721A, Ownable {
    using Strings for uint256;

    string public baseURI;
    string public metadataExtension = ".json";

    constructor(string memory _name, string memory _symbol, string memory _baseURI) ERC721A(_name, _symbol) {
        baseURI = _baseURI;
    }

    function setMetadataExtension(string memory _newExtension) public onlyOwner {
        metadataExtension = _newExtension;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function mint(uint256 _quantity) external payable {
        _mint(msg.sender, _quantity);
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseURI, tokenId.toString(), metadataExtension));
    }

    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }
}
