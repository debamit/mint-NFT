// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "ds-test/test.sol";
import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../NFT.sol";

contract NFTTest is DSTest {
     using stdStorage for StdStorage;

    Vm private vm = Vm(HEVM_ADDRESS);
    NFT private nft;
    StdStorage private stdstore;


    function setUp() public {
        nft = new NFT("NFT_tutorial", "TUT", "baseUri");
    }

     function testFailNoMintPricePaid() public {
        nft.mintTo(address(1));
    }

    function testMintPricePaid() public {
        nft.mintTo{value: 0.08 ether}(address(1));
    }
}
