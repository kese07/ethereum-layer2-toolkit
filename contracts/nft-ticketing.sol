// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTTicketing is ERC721 {
    uint256 public nextTicketId;

    constructor() ERC721("EventTicket", "TICKET") {}

    function mintTicket(address recipient) public returns (uint256) {
        _mint(recipient, nextTicketId);
        nextTicketId++;
        return nextTicketId - 1;
    }

    function transferTicket(address from, address to, uint256 ticketId) public {
        require(ownerOf(ticketId) == from, "You do not own this ticket");
        safeTransferFrom(from, to, ticketId);
    }
}