pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;

contract IPFS{
    address public manager;
    
    uint public imageIndex;
    mapping(uint => string) public imageHashes;
    mapping(address => string []) public imageHashes2;
    
    uint public userIndex;
    mapping(uint => address) public users;
    
    
    // modifiers
        
    modifier RegisteredUser{
        require(imageHashes2[msg.sender].length != 0  );
        _;
    }
        
    //

    function IPFS() public{ 
        manager = msg.sender;
    }
    
    function setImageHash(string _imageHash) public{
        imageHashes[imageIndex] = _imageHash;
        imageIndex ++;
    }
    
    function registerUser(address _userAddress) public{
        
    }
    
    function setImageHash_(string _imageHash , address _imageOwner) public{
        imageHashes2[_imageOwner].push(_imageHash);
        imageIndex ++;
    }
    
    function getImageHash(uint _imageIndex) public view returns(string ){
        return imageHashes[_imageIndex];
    }
    
    function getImageHash_(address _imageOwner) public view returns(string [] ){
        return imageHashes2[_imageOwner];
    }
    
    function getImageIndex() public view returns(uint){
        return imageIndex;
    }
    
}