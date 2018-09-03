pragma solidity ^0.4.24;

contract Ownable {
    address private owner;

    modifier isOwner {
        require(msg.sender == owner, "only for owners");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
}
