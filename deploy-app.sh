set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

cd "$SCRIPT_DIR"

pushd "selfsigned"
  ./scripts/package.sh
  ./scripts/deploy.sh
popd

echo "Done!"
