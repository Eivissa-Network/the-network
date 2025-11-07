---
title: Recognition Registry Specification
version: 1.0
license: CC BY 4.0
---

# Recognition Registry Specification
Defines the on-chain registry mirrored to Wikidata for entities recognizing The Network.

## JSON-LD Data Model
```json
{
  "@context": "https://the.network/context/v1",
  "type": "Recognition",
  "entity": "did:web:partner.org",
  "role": "University|NGO|DAO|City|Company",
  "evidence": ["ipfs://...", "doi:..."],
  "signature": "0x...",
  "timestamp": "ISO8601"
}
```

## Protocol
- `recognize(did:peer)` → store signature in registry → publish to IPFS → mirror to Wikidata.  
- Governance: Assembly ratifies tiers; Council maintains endpoints and DID channels.
