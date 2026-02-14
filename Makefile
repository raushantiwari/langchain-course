# Makefile
.PHONY: help install dev start test clean

# Colors
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m

##@ Help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2 } /^##@/ { printf "\n$(YELLOW)%s$(NC)\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Setup
install: ## Install dependencies
	@echo "$(BLUE)Installing dependencies...$(NC)"
	uv sync
	@echo "$(GREEN)✓ Dependencies installed$(NC)"

##@ Development
dev: ## Start development server (127.0.0.1:8001)
	@echo "$(BLUE)Starting development server on http://127.0.0.1:8001$(NC)"
	@ENV_FILE=.env.development uv run uvicorn src.app.main:app \
		--reload \
		--host 127.0.0.1 \
		--port 8001 \
		--log-level debug

##@ Production
start: ## Start production server (0.0.0.0:8002)
	@echo "$(BLUE)Starting production server on http://0.0.0.0:8002$(NC)"
	@ENV_FILE=.env.production uv run uvicorn src.app.main:app \
		--host 0.0.0.0 \
		--port 8002 \
		--workers 4 \
		--log-level info

##@ Testing
test: ## Run tests
	@echo "$(BLUE)Running tests...$(NC)"
	uv run pytest
	@echo "$(GREEN)✓ Tests complete$(NC)"

##@ Cleanup
clean: ## Clean cache and build artifacts
	@echo "$(BLUE)Cleaning...$(NC)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	@echo "$(GREEN)✓ Clean complete$(NC)"
