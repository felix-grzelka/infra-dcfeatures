#!/bin/sh
set -e

echo "Activating feature 'hostctl'"
echo "The provided version is: ${VERSION}"
export HOSTCTL_VERSION=$VERSION

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

apt_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Updating th e distribution with apt..."
        apt update -y
    fi
}

# Checks if packages are installed and installs them if not
ensure_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

export DEBIAN_FRONTEND=noninteractive
# Retrieve OS info
. /etc/os-release

# Install dependencies
ensure_packages apt-transport-https wget ca-certificates

wget "https://github.com/guumaster/hostctl/releases/download/v${HOSTCTL_VERSION}/hostctl_${HOSTCTL_VERSION}_linux_amd64.deb"
pwd
ls -la $PWD
dpkg -i "${PWD}/hostctl_${HOSTCTL_VERSION}_linux_amd64.deb"