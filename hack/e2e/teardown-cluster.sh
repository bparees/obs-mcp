#!/bin/bash
set -euo pipefail

CLUSTER_NAME="${CLUSTER_NAME:-obs-mcp-e2e}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"

echo "==> Deleting Kind cluster: ${CLUSTER_NAME}"
kind delete cluster --name "${CLUSTER_NAME}"

echo "==> Cleaning up kube-prometheus clone"
rm -rf "${ROOT_DIR}/tmp/kube-prometheus"

echo "==> Teardown complete!"
