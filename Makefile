## help: Print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## test: Run tests
.PHONY: test

test:
	nvim --headless -u tests/minimal_init.lua \
		-c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua', sequential = true}"

## fix: Run linter & formatter
fix:
	luacheck src tests && stylua src tests

## lint: Run linter
lint:
	luacheck lua/** tests

## format: Run formatter
format:
	stylua lua/** tests
