// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract sample{
uint n;

function setter(uint no) public  {
n=no;

}
function getter() public view returns (uint) {
return n;
}
}
