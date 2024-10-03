// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/HealthyFood.sol";

contract HealthyFoodTest is Test {
    MyBaseNFT nft;
    address owner;
    address recipient;

    function setUp() public {
        nft = new MyBaseNFT();
        owner = address(this);
        recipient = vm.addr(1);
    }

    function testMintNFT() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(recipient, tokenURI);

        assertEq(newItemId, 1);
        assertEq(nft.ownerOf(newItemId), recipient);
        assertEq(nft.tokenURI(newItemId), tokenURI);
    }

    function testTransferNFT() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(owner, tokenURI);

        nft.transferNFT(owner, recipient, newItemId);

        assertEq(nft.ownerOf(newItemId), recipient);
    }

    function testFailUnauthorizedTransfer() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(recipient, tokenURI);

        vm.prank(address(2));
        nft.transferNFT(recipient, owner, newItemId);
    }
}
