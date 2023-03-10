// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";

// @custom:security-contact haoweizerolin@gmail.com
contract CatsAndFoxes is ERC721, ERC721URIStorage, ERC721Enumerable, ERC721Burnable, Ownable {
  // using Counters for Counters.Counter;
  // Counters.Counter private tokenIdCounter;
  constructor() ERC721("CatsAndFoxes", "CAF") {}
//  bool public paused = true;
  string public baseURI = "ipfs://QmZkVyjqx7T7wS8BJ3PaJHMTqeBUDeRa6fyHeWe7V7hbsN/";
  string public baseExtension = ".json";
  uint256 public nextTokenId = 1;

  function mint() public payable returns (uint256){    
    uint256 tokenId = nextTokenId;
  
    _safeMint(msg.sender, tokenId);
    tokenURI(tokenId);
    nextTokenId ++;
    return tokenId;
    
  }


  function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory)
  {
    require (_exists(tokenId), "NFT is not exist.");
    return string(abi.encodePacked(baseURI, Strings.toString(tokenId), baseExtension));
  }

  function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize) internal override(ERC721, ERC721Enumerable) {
    super._beforeTokenTransfer(from, to, tokenId, batchSize);
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
    return super.supportsInterface(interfaceId);
  }

  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }
}