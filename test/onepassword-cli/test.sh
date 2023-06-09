#!/bin/bash


# This test can be run with the following command:
#
#    devcontainer features test    \ 
#               --features onepassword-cli   \
#               --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#               /path/to/this/repo

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

check "validate 1password" op --version

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults