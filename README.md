# Kiosk

Kiosk is a protocol that uses smart contracts to organize a decentralized, global product registry.

# How It Works

### DIN

A Decentralized Identification Number (DIN) is a globally unique, 10-digit number that can be used for product identification.

### Register a New DIN

In a web3-enabled Javascript environment, type the following:
```
> const registrarABI = [{"constant":false,"inputs":[],"name":"registerDIN","outputs":[{"name":"DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"index","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"quantity","type":"uint256"}],"name":"registerDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"MAX_QUANTITY","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_registry","type":"address"},{"name":"_genesis","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
> const registrarAddress = "0xcfe8f8dcd29419ba396a496ad2317b784ec23d60"
> const registrar = web3.eth.contract(registrarABI).at(registrarAddress)

// Register a single DIN
> registrar.registerDIN((error, result) => { console.log(result) })

// Register multiple DINs (maximum 10 in one transaction)
> registrar.registerDINs(10, (error, result) => { console.log(result) })
```

Alternatively, you can use MyEtherWallet (https://www.myetherwallet.com/). Go to the website, click on Contracts, and then paste in the above ABI and address and then select either "registerDIN" or "registerDINs" from the Read / Write Contract dropdown.

### Resolver

A resolver contract is responsible for managing product information.

### Add a Resolver

A resolver must implement the following method:

```
function supportsInterface(bytes4 interfaceID) constant returns (bool)
```

*Coming soon!*

## Deployed Contracts

**[DINRegistry.sol](contracts/DINRegistry.sol)**
```
Ethereum Main Network Address: 0x79bf32b2c0f9a3f30fbcc4aa1e3e07e3366b34f9
Kovan Test Network Address: 0xa26993945449fe1bdf22253fd2583da184e90b56
ABI: [{"constant":true,"inputs":[{"name":"DIN","type":"uint256"}],"name":"resolver","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"registrar","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"DIN","type":"uint256"},{"name":"owner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"DIN","type":"uint256"}],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"genesis","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"DIN","type":"uint256"}],"name":"updated","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"DIN","type":"uint256"},{"name":"resolver","type":"address"}],"name":"setResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"DIN","type":"uint256"},{"name":"owner","type":"address"}],"name":"register","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_registrar","type":"address"}],"name":"setRegistrar","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_genesis","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewOwner","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"resolver","type":"address"}],"name":"NewResolver","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewRegistration","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"registrar","type":"address"}],"name":"NewRegistrar","type":"event"}]
```

**[DINRegistrar.sol](contracts/DINRegistrar.sol)**
```
Ethereum Main Network Address: 0xcfe8f8dcd29419ba396a496ad2317b784ec23d60
Kovan Test Network Address: 0xe41d67a3e7866f84bd5db17492a744de23b08df2
ABI: [{"constant":false,"inputs":[],"name":"registerDIN","outputs":[{"name":"DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"index","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"quantity","type":"uint256"}],"name":"registerDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"MAX_QUANTITY","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_registry","type":"address"},{"name":"_genesis","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
```

## Roadmap

* Decentralized Identification Number (DIN) ✅
* Global product registry
  * Resolver contracts ✅
  * Javascript API *(in progress)*
  * REST API *(in progress)*
* Decentralized exchange
  * Pricing
  * Market Token (marks)
  * Identity
* Developer platform
  * Client interfaces (decentralized applications) for search, buy, sell
  * Custom market rules (escrow, loyalty, etc.)
* Reputation system