---
title: Treaty & Accord Format
version: 1.0
license: CC BY 4.0
---

# Treaty & Accord Format
Template for external accords as signed JSON-LD.

```json
{
  "@context": "https://the.network/context/v1",
  "type": "Treaty",
  "parties": ["did:the.network:abc", "did:web:partner.org"],
  "terms": {"dataExchange":"read-only","duration":"5y"},
  "signatures": ["0x..."]
}
```

- Storage: on-chain pointer + IPFS object.  
- Ratification: Assembly supermajority.  
- Revocation: Arbitration ruling + DAO vote.
