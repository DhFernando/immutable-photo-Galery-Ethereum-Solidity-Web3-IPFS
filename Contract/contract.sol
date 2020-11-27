pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;

contract IPFS{
    address public manager;
    
    uint public imageIndex;
    mapping(uint => string) public imageHashes;
    mapping(address => Info ) public imageHashes2;
    
    uint public userIndex;
    mapping(uint => address) public users;
    address [] public users2;
    
    
    struct Info{
        string [] imageHashes;
        bool exists;
    }
    
    // modifiers
        
    modifier userExistency(){
        require(imageHashes2[msg.sender].exists == true );
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
    
    function registerUser( ) public {
        // veryfy user not in the array
        require(imageHashes2[msg.sender].exists == !true );
        
        string[] memory emtyImageArray;
        imageHashes2[msg.sender] = Info( emtyImageArray , true);
    }
    
    function loginUser() public view returns(bool){
        if(imageHashes2[msg.sender].exists == true){
            return true;
        }else{
            return false;
        }
    }
    
    function setImageHash_(string _imageHash , address _imageOwner) public{
        imageHashes2[_imageOwner].imageHashes.push(_imageHash);
    }
    
    function getImageHash(uint _imageIndex) public view returns(string ){
        return imageHashes[_imageIndex];
    }
    
    function getImageHash_(address _imageOwner) userExistency() public view returns(string [] ){
        return imageHashes2[_imageOwner].imageHashes;
    }
    
    function getImageIndex() public view returns(uint){
        return imageIndex;
    }
    
}