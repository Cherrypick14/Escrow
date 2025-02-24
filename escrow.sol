// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Escrow Contract - Ensures secure payments

contract SimpleEscrow {
    address public payer;
    address public payee;

    constructor(address _payee) {
        payer = msg.sender;
        payee = _payee;
    }

    function deposit() external payable {}

    function release() external {
        require(msg.sender == payer, "Only payer can release funds");
        payable(payee).transfer(address(this).balance);
    }
}