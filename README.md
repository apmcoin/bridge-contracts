# Bridge Contracts Boilerplate

Base bridge contract collection for **one-way, one-time token swap**.

## Project Overview

- Lightweight smart contract boilerplate design  
- Optimized gas cost implementation  
- Fully compliant with global security audit standards  

## Contract Analysis

- One-way migration bridge designed for rebranding purposes  
- Intentionally simple to minimize attack vectors  
- Full token balance transfer aligns with the migration/rebranding purpose  
- No withdrawal mechanism by design (source tokens are permanently locked)  
- Immutable contract state ensures a secure migration process  
- Event emission is sufficient for cross-chain verification  

## Compilation

```
npm install
npx hardhat compile
```

```
