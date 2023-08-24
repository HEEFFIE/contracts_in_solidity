// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract lottery{
address public manager;
address payable[] public  participants;

constructor() {
   manager=msg.sender;
}

receive() payable  external {
    require(msg.value==1 ether);
    participants.push(payable (msg.sender));
}
function getbalance() view public  returns(uint){
    require(msg.sender==manager);
    return address(this).balance;
}
function random() public view returns (uint){
  return uint( keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
    
}
function selectWinner() public {
    require(msg.sender==manager);
    require(participants.length>=3);
    uint r=random();
    address payable  winner;
    uint index = r % participants.length;
    winner=participants[index];

      winner.transfer(getbalance());

    
    participants=new address payable [](0);
}
}
