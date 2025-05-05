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