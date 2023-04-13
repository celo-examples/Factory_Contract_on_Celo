// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract TokenFactory {
FoundationToken[] public tokens;
uint256 count;

event TokenCreated (address indexed TokenAddress, string TokenName, uint256 InitialSupply, address Owner, uint256 Index);

function createToken(string memory _tokenName, string memory _symbol, uint256 _initialSupply ) public {
FoundationToken token = new FoundationToken(_tokenName, _symbol, _initialSupply, msg.sender);
tokens.push(token);
uint256 _index = count;
count += 1;
emit TokenCreated(address(token), _tokenName, _initialSupply, msg.sender, _index);
}

function getToken(uint _index) public view
returns (address owner, string memory name, string memory symbol, uint256 totalSupply)
{
FoundationToken token = tokens[_index];

return (token.owner(), token.name(), token.symbol(), token.totalSupply());
}
}
