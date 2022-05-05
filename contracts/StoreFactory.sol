pragma solidity ^0.5.3;

import "@openzeppelin/upgrades/contracts/upgradeability/ProxyFactory.sol";

contract StoreFactory is ProxyFactory{

    address public impl;
    address public owner;

    modifier OnlyOwner() {
        require(msg.sender == owner, 'only the owner can call this function');
        _;
    }
    constructor (address _impl) public {
        impl = _impl;
        owner = msg.sender;
    }

    function clone() public OnlyOwner{
        deployMinimal(impl, "");

    }
}