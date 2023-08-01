// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {

    struct Item {
        uint256 itemId;
        string name;
        uint256 price;
        uint256 quantity;
    }

    Item[] public items;

    constructor() ERC20("Degen Gaming Token", "DGT") {
        // Initialize some sample items. You can modify or add more items as needed.
        items.push(Item(0, "PEN", 100, 100));
        items.push(Item(1, "PENCIL", 200, 50));
    }

    // Mint new tokens and distribute them to players as rewards
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Players can transfer their tokens to others
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        return super.transfer(to, amount);
    }

    // Players can redeem their tokens for items in the in-game store
    function redeem(uint256 itemId, uint256 quantity) public {
        require(itemId < items.length, "Invalid item ID");
        uint256 totalCost = items[itemId].price * quantity;
        require(balanceOf(msg.sender) >= totalCost, "Insufficient balance");
        require(items[itemId].quantity >= quantity, "Insufficient quantity of item");

        // Deduct the redeemed tokens from the player's account
        _transfer(msg.sender, address(this), totalCost);

        // Reduce the quantity of the redeemed item
        items[itemId].quantity -= quantity;
    }

    // Anyone can burn tokens they own if they are no longer needed
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    // Event to indicate the redeemed amount
    event RedemptionAmount(address indexed player, uint256 amount);
}
