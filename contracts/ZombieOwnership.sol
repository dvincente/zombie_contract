// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import {ZombieAttack} from "./ZombieAttack.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {SafeMath} from "./SafeMath.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

    constructor() ERC721("My Zombie NFT", "Zombie") {
    }

    using SafeMath for uint256;

    mapping (uint => address) zombieApprovals;

    function balanceOf(address _owner) override public view returns (uint256 _balance) {
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenId) override public view returns (address _owner) {
        return zombieToOwner[_tokenId];
    }

    function _transferFromTo(address _from, address _to, uint256 _tokenId) private {
        ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
        ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);
        zombieToOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
        _transferFromTo(msg.sender, _to, _tokenId);
    }

    function approve(address _to, uint256 _tokenId) override public onlyOwnerOf(_tokenId) {
        zombieApprovals[_tokenId] = _to;
        emit Approval(msg.sender, _to, _tokenId);
    }

    function takeOwnership(uint256 _tokenId) public {
        require(zombieApprovals[_tokenId] == msg.sender);
        address owner = ownerOf(_tokenId);
        _transferFromTo(owner, msg.sender, _tokenId);
    }
}