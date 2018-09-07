pragma solidity ^0.4.24;

contract Referendum1 {
    uint public yesVotes = 0;
    uint public noVotes = 0;
    
    address[] voted;
    
    modifier onlyOnce {
        require(hasVoted(msg.sender) == false, "alread voted");
        _;
    }
    
    function hasVoted(address user) public view returns(bool) {
        for(uint i = 0; i < voted.length; i++) {
            if (voted[i] == user) {
                return true;
            }        
        }    
        return false;
    }
    
    function sayYes() public onlyOnce {
        voted.push(msg.sender);
        yesVotes++;
    }
    
    function sayNo() public onlyOnce {
        voted.push(msg.sender);
        noVotes++;
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