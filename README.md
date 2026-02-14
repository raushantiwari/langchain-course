# Setup

make install-dev # Install all dependencies
make sync # Sync dependencies

# Development

make dev # Start dev server
make test # Run tests
make test-cov # Run tests with coverage
make lint # Check code
make format # Format code
make check # Run all checks

# Docker

make docker-build # Build Docker image
make docker-up # Start containers
make docker-down # Stop containers

# Production

make build # Build package
make deploy-prod # Deploy to production

# Cleanup

make clean # Clean cache/artifacts
