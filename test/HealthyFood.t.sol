// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/HealthyFood.sol"; // Path ke smart contract NFT Anda

contract HealthyFoodTest is Test {
    MyBaseNFT nft;
    address owner;
    address recipient;

    function setUp() public {
        nft = new MyBaseNFT(); // Deploy kontrak
        owner = address(this); // Owner adalah kontrak ini
        recipient = vm.addr(1); // Buat alamat penerima baru
    }

    function testMintNFT() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(recipient, tokenURI);

        // Cek apakah NFT berhasil dimint
        assertEq(newItemId, 1); // Karena ini NFT pertama yang dimint
        assertEq(nft.ownerOf(newItemId), recipient); // Cek owner dari NFT yang dimint
        assertEq(nft.tokenURI(newItemId), tokenURI); // Cek URI tokennya
    }

    function testTransferNFT() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(owner, tokenURI); // Mint untuk owner

        nft.transferNFT(owner, recipient, newItemId); // Transfer ke recipient

        // Cek apakah NFT berhasil ditransfer
        assertEq(nft.ownerOf(newItemId), recipient); // Owner seharusnya recipient sekarang
    }

    function testFailUnauthorizedTransfer() public {
        string memory tokenURI = "https://example.com/metadata.json";
        uint256 newItemId = nft.mintNFT(recipient, tokenURI); // Mint untuk recipient

        vm.prank(address(2)); // Simulasikan panggilan dari address yang tidak berhak
        nft.transferNFT(recipient, owner, newItemId); // Ini seharusnya gagal
    }
}
