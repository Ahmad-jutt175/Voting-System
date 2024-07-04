// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    struct Voter {
        uint weight; // Weight accumulated by delegation
        bool voted; // If true, the person already voted
        address delegate; // Person delegated to
        uint vote; // Index of the voted proposal
    }

    struct Proposal {
        bytes32 name; // Short name (up to 32 bytes)
        uint voteCount; // Number of accumulated votes
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({ name: proposalNames[i], voteCount: 0 }));
        }
    }

    function giveRightToVote(address voter) external view{
        require(msg.sender == chairperson, "Only chairperson can give right to vote.");
        require(!voters[voter].voted, "The voter already voted.");
        // Additional logic for granting voting rights
    }

}
