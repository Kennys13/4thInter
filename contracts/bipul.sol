// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {

    constructor() ERC20("Degen Gaming Token", "DGT") {}

    // Mint new tokens and distribute them to players as rewards
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Players can transfer their tokens to others
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        return super.transfer(to, amount);
    }

    // Players can redeem their tokens for items in the in-game store
    function redeem(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        // Add your redemption logic here for in-game items or other rewards
    }

    // Anyone can burn tokens they own if they are no longer needed
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
}