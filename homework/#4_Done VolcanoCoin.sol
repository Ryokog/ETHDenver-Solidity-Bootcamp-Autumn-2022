// SPDX-License-Identifier: UNLICENSED
// The above is the answer to #3
// #2
pragma solidity ^0.8.0;

// #1 The name of the file VolcanoCoin.sol

// #4
contract VolcanoCoin {

     // #5
    uint256 private totalSupply = 10_000;
    // #8
    address private owner;
    
    // #13 a) The best way is to use mapping. 
    // #13 b)
    mapping (address => uint256) private balances;

    // #19
    mapping(address => Payment[]) private userPayments;
    }

    // #18
    struct Payment {
        address _addr;
        uint256 transferAmount;
    }

    // #12
    event TotalSupplyHasIncreased(address _addr, uint transferAmount); 
    // #17&19
    event TransferHasTakenPlace(address _addr, uint256 amount);

    // #9
    modifier onlyOwner {
        require(msg.sender == owner); 
        _;
    }

    // #11&15
    // Following a security expert's advice, adding "initialOwner" to secure the process
    constructor(address initialOwnersAddress) {
        owner = initialOwnersAddress;
        balances[owner] = totalSupply;
    }

    // #6
    function totalSupply() public view returns(uint256) {
        return totalSupply;
    }

    // #14 One way is to use public. The other way is to use view function
    function get(address _addr) public view returns {
        return balances[_addr];
    }

    // #7&10&12
    function supplyIncrease() public onlyOwner {
   
    // Commenting out the below as it may not be needed when using onlyOwner
    //require(msg.sender == owner);
        totalSupply += 1_000;
        emit TotalSupplyHasIncreased(totalSupply);
    }

    // #16
    // #17
    // Logitally, a transfer is that a sender's account balance decreases whereas a receiver's
    // account balance increases. State the obvious in code.
    function transfer(address _addr, uint256 amount) public {
        balances[msg.sender] -= amount;
        balances[_addr] += amount;
        emit TransferHasTakenPlace(_addr, amount);
    }


