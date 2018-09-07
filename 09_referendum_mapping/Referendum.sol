pragma solidity ^0.4.24;

contract Referendum {
    uint public yesVotes = 0;
    uint public noVotes = 0;
   
    mapping (address => bool) voted;
    
    modifier onlyOnce {
        require(voted[msg.sender] != true, "only one vote per person");
        _;
    }
    
    function sayYes() public onlyOnce {
        voted[msg.sender] = true;
        yesVotes++;
    }
    
    function sayNo() public onlyOnce {
        voted[msg.sender] = true;
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
