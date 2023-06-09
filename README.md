# Dev Container Features:

This repository contains Features to be used in devcontainers used for developing software in the context infrastructure.

Features are individually versioned by the `version` attribute in a Feature's `devcontainer-feature.json`.  Features are versioned according to the semver specification.
## Contents

This repository contains following features:
- [ionosctl](./src/ionosctl/README.md): Install IONOS CLI tool
- [hostctl](./src/hostctl/README.md): Install the amazing hostctl tool
- [1Password CLI](./src/onepassword-cli/README.md): Install the CLI tool for 1Password
- [helm-diff Plugin](./src/helm-diff-plugin/README.md): Install the helm-diff plugin for Helm

## Usage

To use the features from this repository, add the desired features to devcontainer.json.

This example use google-cloud-cli feature on devcontainer.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/dhoeric/features/onepassword-cli:1": {
            "version": "latest"
        }
    }
}
```

## Repo and Feature Structure

Similar to the [`devcontainers/features`](https://github.com/devcontainers/features) repo, this repository has a `src` folder.  Each feature has its own sub-folder, containing at least a `devcontainer-feature.json` and an entrypoint script `install.sh`.

```
├── src
│   ├── ionosctl
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
│   ├── hostctl
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
...
```

An [implementing tool](https://containers.dev/supporting#tools) will composite [the documented dev container properties](https://containers.dev/implementors/features/#devcontainer-feature-json-properties) from the feature's `devcontainer-feature.json` file, and execute in the `install.sh` entrypoint script in the container during build time.  Implementing tools are also free to process attributes under the `customizations` property as desired.