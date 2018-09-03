pragma solidity ^0.4.24;

import "./Ownable.sol";

contract HelloWorld is Ownable {
    string greeting = "Witaj Świecie";
    
    function getGreeting() public view returns(string) {
        return greeting;
    }

    function getSuperGreeting() public view isOwner returns(string) {
        return "Hey you are awesome!";    
    }
    
    function setGreeting(string _greeting) public isOwner {
        greeting = _greeting;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
}