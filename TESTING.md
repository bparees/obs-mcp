# Testing

This document describes how to run tests for obs-mcp.

## Linting

Run golangci-lint to check code quality:

```bash
make lint
```

To automatically fix issues:

```bash
make lint-fix
```

## Unit Tests

Run unit tests with:

```bash
make test-unit
```

## End-to-End (E2E) Tests

E2E tests validate obs-mcp against a real Kubernetes cluster with Prometheus.

### Prerequisites

- [Go](https://golang.org/dl/) 1.24+
- [Docker](https://docs.docker.com/get-docker/) or [Podman](https://podman.io/)
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

### Running E2E Tests

**To use Podman instead of Docker, export the following:**

```bash
export CONTAINER_CLI=podman
```

#### Full Test Cycle

Run setup, deploy, test, and teardown in one command:

```bash
make test-e2e-full
```

#### Step-by-Step (Recommended for Development)

1. **Setup Kind cluster with kube-prometheus:**

```bash
make test-e2e-setup
```

This creates a Kind cluster and installs Prometheus Operator, Prometheus, and Alertmanager.

2. **Build and deploy obs-mcp:**

```bash
make test-e2e-deploy
```

3. **Run E2E tests:**

```bash
make test-e2e
```

4. **Teardown (when done):**

```bash
make test-e2e-teardown
```
