pragma solidity ^0.4.24;

contract HelloWorld {
    string greeting = "Witaj Świecie";
    address owner;

    modifier isOwner {
        require(msg.sender == owner, "only for owners");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }

    function getGreeting() public view returns(string) {
        return greeting;
    }

    function getSuperGreeting() public view isOwner returns(string) {
        return "Hey you are awesome!";    
    }
    
    function setGreeting(string _greeting) public isOwner {
        greeting = _greeting;
    }
}