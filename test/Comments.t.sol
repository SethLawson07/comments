// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Comments.sol";

contract CommentsTest is Test {
    Comments public comments;
    uint32 previousId;
    uint32 currentId;

    function setUp() public {
        comments = new Comments();
        previousId = comments.idCounter();
    }

    function testAdd() public {
        comments.addComment("Foot","oklm");
        currentId = comments.idCounter();
        assertEq(currentId, previousId+1);
    }

    function testAdd(string calldata topic, string calldata message) public {
        comments.addComment(topic,message);
        currentId = comments.idCounter();
        assertEq(currentId, previousId+1);
    }

}
