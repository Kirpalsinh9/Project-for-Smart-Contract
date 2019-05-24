pragma solidity ^0.5.8;

contract lottery
{
    struct player{
        string name;
        uint age;
        string region;
        address  payable user;
    }
   address owner;
   uint public playercount;
   enum State{OPEN,CLOSED}
   player[]  playerList;
   
   mapping(address=>uint) public bet;
   State public currentstate;
  event winner(address _playeraddress,uint _winningprice); 
  constructor()public
  {
    owner=msg.sender;
    playercount=0;
    currentstate = State.OPEN;
  }
  modifier onlyowner()
    {
        require(msg.sender==owner);
        _;
    }
   modifier lotteryopen(){
       require(currentstate == State.OPEN);
       _;
   } 
   modifier lotteryclosed{
       require(currentstate == State.CLOSED);
       _;
   }
   function toopenlottery() public onlyowner{
       currentstate = State.OPEN;
   }
   function tocloselottery() public onlyowner{
       currentstate = State.CLOSED;
   }
  function Enterlottery(string memory _name,uint _age,string memory _region) payable public lotteryopen
  {
    require(msg.sender!=owner && msg.value>0.01 ether);
    
     playerList.push(player(_name,_age,_region,msg.sender));
     bet[msg.sender]=msg.value;
     playercount++;
     
  }

    function random() private view returns(uint)
    {
        return uint(keccak256(abi.encode(block.number,block.coinbase)));
    
    }
    

   function pickwinner() public onlyowner payable lotteryclosed
      {   
        
        uint index=random()%playerList.length;
              
        playerList[index].user.transfer(address(this).balance);
        emit winner(playerList[index].user,address(this).balance);
     }

}