// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulBoundToken is ERC721Enumerable, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIdCounter;
  string private _buri;
  mapping(address => bool) private _whitelist;

  event AddWhitelist(address indexed who);
  event RemoveWhitelist(address indexed who);

  constructor() ERC721("Proof of value SBT", "PSBT") {
    _whitelist[msg.sender] = true;
  }

  function _baseURI() internal view override returns (string memory) {
    return _buri;
  }
  function setBaseURI(string memory buri_) external onlyOwner {
    require(bytes(buri_).length > 0, "wrong base uri");
    _buri = buri_;
  }

  modifier includedWhitelist(address who_) {
    require(_whitelist[who_], "This user is not included in the whitelist");
    _;
  }
  function addWhitelist(address who_) external onlyOwner {
    _whitelist[who_] = true;
    emit AddWhitelist(who_);
  }
  function removeWhitelist(address who_) external onlyOwner {
    _whitelist[who_] = false;
    emit RemoveWhitelist(who_);
  }
  function verifyWhitelist(address who_) external view returns (bool) {
    return _whitelist[who_];
  }

  function mint(address to) public includedWhitelist(_msgSender()) {
    _tokenIdCounter.increment();
    uint256 tokenId = _tokenIdCounter.current();
    _safeMint(to, tokenId);
  }

  function burn(uint256 tokenId) external {
    require(ownerOf(tokenId) == msg.sender, "Only the owner of the token can burn it.");
    _burn(tokenId);
  }

  function _beforeTokenTransfer(address from, address to, uint256) pure override internal {
    require(from == address(0) || to == address(0), "This a Soulbound token. It cannot be transferred. It can only be burned by the token owner.");
  }

  function _burn(uint256 tokenId) internal override(ERC721) {
    super._burn(tokenId);
  }
}