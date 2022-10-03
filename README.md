
#README


#deploy in ropten blockchain

before to deploy, create in root path file ./secrets.json, must be set the wallet secrets words and id of infura

example content:

{
    "mnemonic": "qwe qqwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe",
    "projectId": "xxxxxxxxxxxx"
}

Compiling your contracts...
===========================
> Compiling .\contracts\ApprovalContract.sol
> Artifacts written to proyectETHPool\build\contracts
> Compiled successfully using:
   - solc: 0.8.13+commit.abaa5c0e.Emscripten.clang


Starting migrations...
======================
> Network name:    'ropsten'
> Network id:      3
> Block gas limit: 30000000 (0x1c9c380)


1_ApprovalContract.js
=====================
Deploying ETHPool Challenge.
{ network: 'ropsten' }

   Replacing 'ApprovalContract'
   ----------------------------
   > transaction hash:    0x0156e600aea6029d1d46ecebc02a6b7f27404e54e3afc887b80992641de50060
   > Blocks: 1            Seconds: 13
   > contract address:    0xA312e6df00f8E6d6CdF3b9FA4a996900591045c6
   > block number:        13085452
   > block timestamp:     1664757552
   > account:             0x7d9FEC12AdEba49d4E24C8D2E1888e1d3722699E
   > balance:             1.251526525989722363
   > gas used:            1110499 (0x10f1e3)
   > gas price:           2.500000007 gwei
   > value sent:          0 ETH
   > total cost:          0.002776247507773493 ETH

   Pausing for 2 confirmations...

   -------------------------------
   > confirmation number: 1 (block: 13085453)
   > confirmation number: 2 (block: 13085454)
┌───────────────────┬──────────────────────────────────────────────┐
│      (index)      │                    Values                    │
├───────────────────┼──────────────────────────────────────────────┤
│ ApprovalContract1 │ '0xA312e6df00f8E6d6CdF3b9FA4a996900591045c6' │
└───────────────────┴──────────────────────────────────────────────┘
   > Saving artifacts
   -------------------------------------     
   > Total cost:     0.002776247507773493 ETH

Summary
=======
> Total deployments:   1
> Final cost:          0.002776247507773493 ETH



