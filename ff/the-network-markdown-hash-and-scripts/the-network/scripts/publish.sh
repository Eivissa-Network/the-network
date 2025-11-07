#!/usr/bin/env bash
set -euo pipefail

# Repository root (this script should run from repo root)
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

FILE="constitution/Charter_of_Network_Sovereignty.md"
HASH_FILE="constitution/charter.hash.json"

echo "Computing SHA3-512 for $FILE"
HASH=$(python3 - <<'PY'
import hashlib, sys, pathlib, json
p = pathlib.Path(sys.argv[1]).read_bytes()
print(hashlib.sha3_512(p).hexdigest())
PY
"$ROOT_DIR/$FILE")

echo "Hash: $HASH"

# Update JSON (anchors left as TODO)
python3 - <<'PY'
import json, sys, pathlib, datetime
root = pathlib.Path(sys.argv[1])
hash_file = root / "constitution" / "charter.hash.json"
obj = json.loads(hash_file.read_text(encoding="utf-8"))
obj["sha3_512"] = sys.argv[2]
obj["date"] = datetime.datetime.now().astimezone().isoformat()
hash_file.write_text(json.dumps(obj, indent=2), encoding="utf-8")
print("Updated", hash_file)
PY
"$ROOT_DIR" "$HASH"

echo "Next steps:"
echo "  1) Anchor this hash on Bitcoin (OP_RETURN), Ethereum (calldata), and Arweave."
echo "  2) Paste resulting TXIDs into constitution/charter.hash.json under anchors.*"
echo "  3) Commit and push:"
echo "     git add constitution/Charter_of_Network_Sovereignty.md constitution/charter.hash.json"
echo "     git commit -m \"chore(charter): update SHA3-512 to $HASH\""
echo "     git push origin main"
