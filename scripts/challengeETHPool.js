const ApprovalContract = artifacts.require('ApprovalContract');

module.exports = async (callback) => {
  try {
    const ApprovalContract = await ApprovalContract.deployed();
    const reciept = await ApprovalContract.getAmountAll();
    console.log(reciept);

  } catch(err) {
    console.log('Oops: ', err.message);
  }
  callback();
};
