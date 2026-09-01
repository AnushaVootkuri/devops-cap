## Final CI/CD Implementation

GitHub Actions uses:

- docker/login-action
- docker/setup-buildx-action
- docker/build-push-action

Images are tagged using:

1. Git commit SHA
2. latest

Example:

devops-backend:<git-sha>
devops-backend:latest

devops-frontend:<git-sha>
devops-frontend:latest

## Final Pipeline

Git push
    ↓
GitHub Actions
    ↓
Backend tests
    ↓
Docker Buildx
    ↓
Docker images
    ↓
Docker Hub
