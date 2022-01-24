//SPDX-License-Identifier: UNLICENSED
// Recieve information and mint an NFT
pragma solidity ^0.8.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/openzeppelin-solidity/contracts/access/Ownable.sol";
import "../node_modules/openzeppelin-solidity/contracts/utils/Counters.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

//NFT inherits ERC721 token contract
contract BonDeFiNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("BonDefi", "BDF") {}

    function create(address to, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 tokenId = _tokenIds.current();

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}

//mints the erc-20 and gives it to the contract caller
contract bondtoken is ERC20 {
    constructor(
        string memory name,
        string memory symbol,
        uint256 supply
    ) ERC20(name, symbol) {
        _mint(msg.sender, supply);
    }

    function createToken(
        uint256 tokenId,
        BonDeFiNFT _nft,
        uint256 number
    ) public {
        address myAddress = _nft.ownerOf(tokenId);
        _mint(myAddress, number);
    }
}
