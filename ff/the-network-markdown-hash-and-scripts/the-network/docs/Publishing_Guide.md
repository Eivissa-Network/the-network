---
title: Publishing Guide — Versioning & Anchoring
version: 1.0
---

# Publishing Guide
- Each file has front matter for version/hash.  
- On ratification: compute SHA3 hash of the file; anchor to BTC/ETH/Arweave; record TXIDs.  
- Open a PR updating `hash` and adding a `charter.hash.json` (see template).

## charter.hash.json (template)
```json
{
  "file": "constitution/Charter_of_Network_Sovereignty.md",
  "sha3_512": "<hex>",
  "anchors": {
    "bitcoin_op_return": "<txid>",
    "ethereum_calldata": "<txid>",
    "arweave_tx": "<txid>"
  },
  "date": "<ISO8601>",
  "signatures": ["0xCouncil1", "0xCouncil2"]
}
```
