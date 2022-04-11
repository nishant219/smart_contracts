// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Ballot{

    struct Voter{
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    struct Proposal{
        bytes32 name;
        uint voteCount;
    }

    address public chairPerson;

    mapping(address=>Voter) public voters; 

    Proposal[]public proposalsArray;

    constructor(bytes32[] memory proposalNames){
        chairPerson=msg.sender;
        voters[chairPerson].weight=1;

        for(uint i=0;i<proposalNames.length;i++){
            proposalsArray.push(Proposal({
                name:proposalNames[i],
                voteCount:0
            }));
        }

    }
    function giveRightToVote(address voter)external{
        
        require( msg.sender==chairPerson,"Only chair person can give right to vote");
        require(!voters[voter].voted, "The voter already voted");
        require(voters[voter].weight==0);
        voters[voter].weight=1;
    }




} 