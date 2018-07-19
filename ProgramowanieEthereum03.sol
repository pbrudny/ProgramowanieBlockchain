pragma solidity ^0.4.24;

contract HelloWorld {
    string greeting = "Witaj Świecie";

    function getGreeting() public view returns(string) {
        return greeting;
    }

    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }
}