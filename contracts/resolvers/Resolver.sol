pragma solidity ^0.4.11;

/** @title Base resolver interface */
contract Resolver {
    function supportsInterface(bytes4 interfaceID) constant returns (bool);
}