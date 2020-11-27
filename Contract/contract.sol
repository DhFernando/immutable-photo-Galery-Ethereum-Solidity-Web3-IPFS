pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;

contract IPFS{
    address public manager;
    
    mapping(address => Info ) public imageHashes;
 
    struct Info{
        string [] imageHashes;
        bool exists;
    }
    
    // modifiers
        
    modifier userExistency(){
        require(imageHashes[msg.sender].exists == true );
        _;
    }
        
    //

    function IPFS() public{ 
        manager = msg.sender;
    }
    
    function registerUser( ) public {
        // veryfy user not in the array
        require(imageHashes[msg.sender].exists == !true );
        
        string[] memory emtyImageArray;
        imageHashes[msg.sender] = Info( emtyImageArray , true);
    }
    
    function loginUser() public view returns(bool){
        if(imageHashes[msg.sender].exists == true){
            return true;
        }else{
            return false;
        }
    }
    
    function setImageHash(string _imageHash) public{
        imageHashes[msg.sender].imageHashes.push(_imageHash);
    }

    function getImageHashes() userExistency() public view returns(string [] ){
        return imageHashes[msg.sender].imageHashes;
    }
    
    
}