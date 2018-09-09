pragma solidity ^0.4.24;

contract Referendum {
    uint public yesVotes = 0;
    uint public noVotes = 0;
    uint public endTime;
    
    mapping (address => string) voted;
    
    event Voting(string _vote, address _user);
    
    modifier onlyOnce {
        require(bytes(voted[msg.sender]).length == 0, "only one vote per person");
        _;
    }
    
    modifier isOpen {
        require(now < endTime, "referendum is finished");
        _;
    }
    
    constructor(uint _timeLimit) public {
        endTime = now + _timeLimit;    
    }  
    
    function sayYes() public onlyOnce isOpen {
        voted[msg.sender] = "YES";
        yesVotes++;
        emit Voting("User voted yes", msg.sender);
    }
    
    function sayNo() public onlyOnce isOpen {
        voted[msg.sender] = "NO";
        noVotes++;
        emit Voting("User voted no", msg.sender);
    }
    
    function result() public view returns(string) {
        if (yesVotes > noVotes) {
            return "YES";
        } else if (yesVotes < noVotes) {
            return "NO";
        } else {
            return "same number of votes for yes and no";
        }
    }
}