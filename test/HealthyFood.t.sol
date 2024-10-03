// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/HealthyFood.sol";

contract HealthyFoodTest is Test {
    HealthyFood nft;
    address owner;
    address recipient;

    function setUp() public {
        nft = new HealthyFood();
        owner = address(this);
        recipient = vm.addr(1);
    }

    function testMintNFT() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 _tokenIds = nft.mint(tokenURI);

        assertEq(_tokenIds, 1);
        assertEq(nft.ownerOf(_tokenIds), msg.sender);
        assertEq(nft.tokenURI(_tokenIds), tokenURI);
    }
}
