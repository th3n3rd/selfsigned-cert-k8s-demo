set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
NAMESPACE="selfsigned-demo"

cd "$SCRIPT_DIR/.."

kubectl create ns "$NAMESPACE" || true

kubectl -n "$NAMESPACE" apply -f deployment/application.yaml
kubectl -n "$NAMESPACE" apply -f deployment/ingress.yaml
kubectl -n "$NAMESPACE" apply -f deployment/selfsigned-ingress.yaml

kubectl -n "$NAMESPACE" rollout status "deploy/selfsigned-app" --timeout=120s
echo "Application is ready!"


