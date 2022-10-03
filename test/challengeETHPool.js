const ApprovalContract = artifacts.require("./ApprovalContract.sol");

contract("ApprovalContract", accounts => {
  it("...should reciept ApprovalContract'.", async () => {
    const ApprovalContractInstance = await ApprovalContract.deployed();

    // Set value of Hello World
    const reciept = await ApprovalContract.getAmountAll();

    assert.equal(reciept, "");

    
  });
});
