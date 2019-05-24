List of Function:

1. function toopenlottery() public onlyowner
2. function tocloselottery() public onlyowner
3. function Enterlottery(string memory \_name,uint \_age,string memory \_region) payable public lotteryopen
4. function random() private view returns(uint)
5. function pickwinner() public onlyowner payable lotteryclosed

--Use Case:--

This smart contract is based on lottery. Anyone can join this lottery but for that, the state must have to be open. To change the state there are 2 functions that can be run by only owner of the contract. First one is toopnlottery() which is for opening up the lottery and then anyone can join the lottery by running the enterlottery() function and they would have to add some information with that function and they also have to bet more than 0.01 ether. Then, there is another one function which is for closing the lottery that can only be run by the owner. The owner would have to run that function in order to run other function called pickwinner() which is also run by only owner. That pickwinner() function selects the player randomly and transfers the balance of the contract to that player who has won the lottery. That pickwinner() function has another function in it which is random() function, a private function, that gives the uint value in return through keccak256 function. This smart contract also includes one event that displays who is the winner and how much that winner has won.
