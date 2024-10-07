# Set the name of your binary here
BINARY_NAME=fiberapi

# Go files to check for formatting, linting, etc.
GOFILES=$(shell find . -name "*.go" -type f)

# Service Name
NAME ?=

# Default target when running `make`
.PHONY: all
all: build

# Clean up binary and object files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -f $(BINARY_NAME)

# Build the Go binary
.PHONY: build
build:
	@echo "Building the application..."
	@go build -o $(BINARY_NAME) .

# Run the application
.PHONY: run
run: 
	@echo "Running the application..."
	@air

# Run tests
.PHONY: test
test:
	@echo "Running tests..."
	@go test ./...

# Format Go code
.PHONY: fmt
fmt:
	@echo "Formatting Go code..."
	@go fmt ./...

# Run Go vet to catch potential errors
.PHONY: vet
vet:
	@echo "Running go vet..."
	@go vet ./...

# Run Go lint (you need to install golangci-lint)
.PHONY: lint
lint:
	@echo "Linting Go code..."
	@golangci-lint run

# Run all checks (fmt, vet, lint, test)
.PHONY: check
check: fmt vet lint test
	@echo "All checks passed!"

# Install dependencies (if using Go Modules)
.PHONY: deps
deps:
	@echo "Downloading dependencies..."
	@go mod tidy
	@go mod vendor

# Install Go tools (if required)
.PHONY: tools
tools:
	@echo "Installing tools..."
	@go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Make Service
.PHONY: service
service:
	@if [ -z "$(NAME)" ]; then \
		echo "Error: NAME is not set. Please provide it using 'make service NAME=<name>'"; \
		exit 1; \
	fi
	@echo 'Creating service: ${NAME}'
	@mkdir -p services/${NAME}
	@echo 'package ${NAME}' > services/${NAME}/handler.go
	@echo 'package ${NAME}' > services/${NAME}/routes.go
	@echo 'package ${NAME}' > services/${NAME}/request.go
	@echo 'Service ${NAME} created'
