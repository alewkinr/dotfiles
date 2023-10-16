.DEFAULT_GOAL := help

SHELL := /bin/bash


.PHONY: help # Generate list of targets with descriptions
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\* \1\t\2/' | expand -t20


.PHONY: git/submodules # Initialize and update git submodules
git/submodules:
	@echo "Initializing and updating git submodules... 🚀"
	git submodule update --init



.PHONY: state/refresh # Refresh state for scripts
state/refresh:
	@echo "Refreshing state... 🚀"
	chezmoi -c chezmoi.toml state delete-bucket --bucket=scriptState