const ApprovalContract = artifacts.require("ApprovalContract");

let ApprovalContract1;

module.exports = async function(deployer,network,accounts) {
  console.log(`Deploying ETHPool Challenge.`)

  console.log({network});
  let currentAccount = accounts[0]; 


  deployer.deploy(ApprovalContract).then((instance) => {
    ApprovalContract1 = instance;
    console.table({
      ApprovalContract1:ApprovalContract.address,
        
    })
});

};

