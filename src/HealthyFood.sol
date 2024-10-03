// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract HealthyFood is ERC721URIStorage, Ownable {
    uint256 public _tokenIds;

    event Minted(address indexed owner, uint256 indexed tokenId, string tokenURI);

    constructor() ERC721("Healthy Food", "HF") Ownable(msg.sender) {}

    // tokenURI = "ipfs://QmaqffhK8kU9LHH56uvtYXbZKsdM2P3HCau4TWQ3iZnYpi"
    function mint(string memory tokenURI) public returns (uint256) {
        _tokenIds++;

        _mint(msg.sender, _tokenIds);
        _setTokenURI(_tokenIds, tokenURI);

        emit Minted(msg.sender, _tokenIds, tokenURI);
        return _tokenIds;
    }
}
