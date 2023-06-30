//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Comments {
    struct Comment {
        uint32 id;
        string topic;
        address creator_address;
        string message;
        uint created_at;
    }

    uint32 public idCounter;
    mapping(string => Comment[]) public commentsByTopic;
        
    event AddComment(Comment comment);

    function getComments(string calldata topic) external  view returns(Comment[] memory) {
       return commentsByTopic[topic];
    }

    function addComment(string calldata topic, string calldata message) external  {
        require(msg.sender!=address(0), "The caller's address cannot be zero.");
        Comment memory comment = Comment({
            id: idCounter,
            topic: topic,
            creator_address: msg.sender,
            message: message,
            created_at: block.timestamp
        });
        commentsByTopic[topic].push(comment);
        idCounter++;
        emit AddComment(comment);
    }
}