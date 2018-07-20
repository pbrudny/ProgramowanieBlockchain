pragma solidity ^0.4.24;

contract HelloWorld {
    string greeting = "Witaj Świecie";
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function getGreeting() public view returns(string) {
        return greeting;
    }

    function setGreeting(string _greeting) public {
        require(msg.sender == owner);
        greeting = _greeting;
    }
}