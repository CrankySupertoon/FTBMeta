.DEFAULT_GOAL := help

help: ## Displays the help dialog
	@echo 'ftbweb Build Tool (powered by Make)'
	@echo
	@echo 'Usage:'
	@echo '  make <target>'
	@echo
	@echo 'Targets:'
	@echo '  buildFtbweb    | Builds ftbweb'
	@echo '  build          | Builds the site'
	@echo '  serve          | Serves the built site on ::3000'
	@echo '  help           | Shows help'

buildFtbweb: ## Builds ftbweb
	sh prepare.sh > /dev/null 2>&1 && \
	cd ftbweb && \
	go build -o ../bin/generate ./cmd/ftbweb && \
	go build -o ../bin/serve ./cmd/serve

build: buildFtbweb ## Builds the site
	./bin/generate

serve: build ## Serves the project to 127.0.0.1:3000
	./bin/serve
