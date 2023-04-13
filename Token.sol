// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FoundationToken is ERC20 {
uint256 public initialAmount;
address public owner;

constructor(string memory _tokenName, string memory _symbol, uint256 _amount, address _owner) 
ERC20(_tokenName, _symbol) {
owner =_owner;
initialAmount = _amount;
_mint(msg.sender, initialAmount);
}
function Mint(address _toAddress, uint256 _amount) public {
require(msg.sender == owner, "Only Owner can call this function!");
_mint(_toAddress, _amount);
}
}

