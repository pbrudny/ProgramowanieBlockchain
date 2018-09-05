pragma solidity ^0.4.24;

contract Referendum {
    uint public yesVotes = 0;
    uint public noVotes = 0;
   
    function sayYes() public {
        yesVotes++;
    }
    
    function sayNo() public {
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