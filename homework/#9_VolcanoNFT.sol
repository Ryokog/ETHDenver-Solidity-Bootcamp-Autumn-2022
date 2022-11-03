// Homework 9
// Volcano NFT
// We now want to create an NFT.
// We will use the Open Zeppelin libraries to help with this.
// 1. Create a new project in the IDE of you choice called NFTProject
// 2. Create a VolcanoNFT contract this should inherit from ERC721Full from the Open
// Zeppelin standard libraries
// . Give your NFT a name and a symbol.
// . Write unit tests to check that you can
//1. Mint new NFTs
// 2. Transfer an NFT
// . Deploy your contract to Goerli and send some NFTs to your colleagues.



// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";

contract VolcanoNFT is ERC721, IERC721Receiver, Ownable {

    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIdCounter;

    constructor(address initialOwnersAddress) ERC721("VolcanoNFT", "VCN") {
        // Openzeppelin writes "Requires the _msgSender() to be the owner, approved, or operator." Is below correct?
        address _msgSender = initialOwnersAddress;
    }

    // Looking at the Openzeppelin wizard https://wizard.openzeppelin.com/#erc721
    function safeMint(address to) public {
            uint256 tokenId = _tokenIdCounter.current();
            _tokenIdCounter.increment();
            _safeMint(to, tokenId);
    }
        
    // Looking at this https://docs.openzeppelin.com/contracts/2.x/api/token/erc721#ERC721-safeTransferFrom-address-address-uint256-bytes-
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override returns(address) {
        bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
        returns _msgSender();

    }
}





