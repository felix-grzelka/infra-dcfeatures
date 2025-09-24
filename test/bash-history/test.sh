#!/bin/bash


set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]

check "validate bash history PROMPT_COMMAND" cat /root/.bashrc | grep 'PROMPT_COMMAND=history -a'
check "validate bash history HISTSIZE" cat /root/.bashrc | grep 'HISTSIZE=-1'
check "validate bash history HISTFILESIZE" cat /root/.bashrc | grep 'HISTFILESIZE=-1'
check "validate bash history HISTFILE" cat /root/.bashrc | grep 'HISTFILE=/root/.history/bash_history'
check "validate bash history HISTTIMEFORMAT" cat /root/.bashrc | grep 'HISTTIMEFORMAT=%F, %T '

check "validate bash history env var HISTFILE" bash -c "echo $HISTFILE | grep '/root/.history/bash_history'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults