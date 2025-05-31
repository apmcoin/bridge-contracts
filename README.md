# VIP-CONTRACTS

Smart contract collection for the VIP project.

## Project Overview

- Lightweight smart contract design
- Optimized gas cost implementation
- Compliant with global security audit standards

## Contract Analysis

### VIP Token Contract
- Minimalist implementation focusing on core functionality
- Optimal gas efficiency through simplified design
- Implements essential ERC20 standards with Permit functionality
- Intentional omission of complex access controls for audit optimization

### Bridge Contract (APMtoVIPBridge)
- Perfectly designed one-way migration bridge for rebranding
- Intentionally simple to minimize attack vectors
- Complete token balance transfer aligns with the rebranding purpose
- No withdrawal mechanism by design, as APM tokens are meant to be permanently locked
- Immutable contract state provides security during the migration period
- Event emission for cross-chain verification is sufficient for the purpose

## Compilation

```
npm install
npx hardhat compile
```

## On-chain info

#### eth mainnet bridge
[Etherscan](https://etherscan.io/address/0xa2b22a062f85c8c2dbcff92e3f4dedee0e679fa3#code)
`0xa2b22a062f85c8c2dbcff92e3f4dedee0e679fa3` 

#### eth mainnet apm
[Etherscan](https://etherscan.io/token/0xC8C424B91D8ce0137bAB4B832B7F7D154156BA6c#code)
`0xC8C424B91D8ce0137bAB4B832B7F7D154156BA6c`

#### bsc mainnet vip
[Bscscan](https://bscscan.com/token/0x400F9Cc49AC28F0De7141A7dA0781be136D27646#code)
`0x400F9Cc49AC28F0De7141A7dA0781be136D27646`

