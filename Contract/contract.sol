pragma solidity ^0.4.17;

contract IPFS{
    uint public imageIndex;
    mapping(uint => string) public imageHashes;
    address public manager;
    
    function IPFS() public{ 
        manager = msg.sender;
    }
    
    function setImageHash(string _imageHash) public{
        imageHashes[imageIndex] = _imageHash;
        imageIndex ++;
    }
    
    function getImageHash(uint _imageIndex) public view returns(string){
        return imageHashes[_imageIndex];
    }
    
    function getImageIndex() public view returns(uint){
        return imageIndex;
    }
    
}