// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevenueSharing {
    address payable[] public recipients;
    uint256[] public percentages;

    constructor(address payable[] memory _recipients, uint256[] memory _percentages) {
        require(_recipients.length == _percentages.length, "Mismatched input lengths");
        recipients = _recipients;
        percentages = _percentages;
    }

    function distributeFunds() public payable {
        for (uint256 i = 0; i < recipients.length; i++) {
            recipients[i].transfer(msg.value * percentages[i] / 100);
        }
    }
}