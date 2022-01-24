// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

//tested code
//mints the erc-20 and gives it to the contract itself 
contract bondtoken is ERC20 {
    constructor (string memory name, string memory symbol, uint256 supply)
    ERC20(name, symbol)
    {
        _mint(address(this), supply);
    }
}

//implement staking
contract staking is bondtoken, IERC721 {

    //replace this with our own NFT contract
    address constant nft_contract = 0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D;

    //staking code
    function _stakeNft(uint256 _tokenId) internal {
        safeTransferFrom(nft_contract, address(this), _tokenId); //transfer nft from contract to this contract
    }
}