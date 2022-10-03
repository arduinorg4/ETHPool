// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract ApprovalContract{
    //owner is Team account

    uint256 private constant PRECISION = 1e12;
    mapping (address => uint) private balances;

    event LogDepositMade(address indexed accountAddress, uint amount);
    event EmergencyWithdraw(address indexed user, uint256 amount);


    //meanwhile calc percentage not can withdraw
    bool internal locked;

    using SafeERC20 for IERC20;

    // Contract owner
    address public owner;

    uint256 internal MAX_INT = 2**256 - 1;

    struct StakerUser {
        uint256 amount;
        address userAddress;
        bool roundValid;
        uint256 porcentageParticipant;
    }

    StakerUser[] public listUser;

    uint256 amountUsers;
    uint256 amountRewards;

    modifier onlyOwner() {
            require(msg.sender == owner, "only owner ###.");
            _;
        }

    modifier lockTrx() {
        require(!locked, "lock smart contract try later");
        locked = true;
        _;
        locked = false;
    }

    
    //sum all pool amount
    mapping(address => uint) private balance;


    constructor(){
        amountUsers = 0;
        amountRewards = 0;
        owner = msg.sender;
        locked = false;
        require(address(owner) != address(0), "address can not be zero");
        
    }

        //loop by all user to put true to receive the rewards
    function applyRewardsUserFlag() private returns(bool){
        for (uint i=0; i<listUser.length; i++) {
                  listUser[uint(i)].roundValid = true;
                  
            }
        return false;
    }


    function searchUser(address _userAddress) private view returns(bool){
        for (uint i=0; i<listUser.length; i++) {
                  
                  if (listUser[uint(i)].userAddress == _userAddress) {
                      return true;
                  }
            }
        return false;
    }
    
    
    //calc all percentaje of all users 
    function calcPercentajeAtAll() internal lockTrx{

        for (uint i=0; i<listUser.length; i++) {
            
            uint256 porcentage = (listUser[uint(i)].amount*100) / getBalances();//calc percentage of each user
            //require(porcentage >= 0 && porcentage <= 100, "Percentage must be a value >=1 and <= 100");
            listUser[uint(i)].porcentageParticipant = porcentage;

        }

    }



/****************/
    function getBalances() public view returns(uint256){
        return balances[owner];
    }

    function depositReward() public payable onlyOwner{
        balances[owner] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        applyRewardsUserFlag();
    }

    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        // Check enough balance available, otherwise just return balance
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
            payable(msg.sender).transfer(withdrawAmount);
        }
        return balances[msg.sender];
    }


/****************/
    function depositUser() public payable{
        //deposito all together
        balances[owner] += msg.value;
                
        bool existUser = searchUser(msg.sender);
        
        if(existUser){
            for (uint i=0; i<listUser.length; i++) {
                  
                  if (listUser[uint(i)].userAddress == msg.sender) {
                      listUser[uint(i)].amount += msg.value;
                      calcPercentajeAtAll(); 
                      emit LogDepositMade(msg.sender, msg.value);
                  }
            }

        }else{
            //creamos nuevo usuario
            listUser.push(StakerUser(msg.value,msg.sender,false,0));
            calcPercentajeAtAll();
        }

    }

/****************/
    function WithdrawByUser() public lockTrx {

            for (uint i=0; i<listUser.length; i++) {
                  if (listUser[uint(i)].userAddress ==  msg.sender) {
                      if(listUser[uint(i)].roundValid){
                        uint256 amountWithPercen = (getBalances() * listUser[uint(i)].porcentageParticipant)/100;
                        withdraw(amountWithPercen);
                        
                        calcPercentajeAtAll(); 

                      }
                      
                  }
            }
        

    }

/****************/
    function emergencyWithdrawAll() external onlyOwner {
        payable(owner).transfer(balance[owner]);

        emit EmergencyWithdraw(address(owner),balance[owner]);

    }

 


}