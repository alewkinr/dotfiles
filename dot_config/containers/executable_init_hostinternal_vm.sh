#!/bin/bash

set -e

MACHINE_NAME="host.internal"

# Initialize and start podman virtual machine
podman machine init --now "$MACHINE_NAME"