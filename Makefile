.PHONY: setup update run

run: ## Build and run the site
	bundle exec jekyll serve

update: ## Update the site with the latest dependencies
	bundle install

setup: ## Setup the site with the latest dependencies
	@echo "🔧 Installing rbenv and ruby-build..."
	@brew install rbenv ruby-build || true

	@echo "🔍 Checking if rbenv is initialized..."
	@if ! command -v rbenv >/dev/null || ! rbenv versions >/dev/null 2>&1; then \
		echo "⚠️  rbenv is not fully initialized in your shell."; \
		echo "👉 Please run: rbenv init"; \
		echo "   Then run 'make setup' again."; \
		exit 1; \
	fi

	@echo "📦 Installing Ruby version..."
	@rbenv install --skip-existing

	@echo "💎 Installing Bundler and Jekyll..."
	@gem install bundler jekyll

	@echo "📦 Installing Ruby dependencies..."
	@$(MAKE) update

help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'