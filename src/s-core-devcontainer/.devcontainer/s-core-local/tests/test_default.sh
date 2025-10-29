#!/usr/bin/env bash
set -euo pipefail

# Read tool versions + metadata into environment variables
. /devcontainer/features/s-core-local/versions.sh

# Common tooling
# For an unknown reason, dot -V reports on Ubuntu Noble a version 2.43.0, while the package has a different version.
# Hence, we have to work around that.
check "validate graphviz is working" bash -c "dot -V"
check "validate graphviz has the correct version" bash -c "dpkg -s graphviz | grep 'Version: ${graphviz_version}'"

# Other build-related tools
check "validate protoc is working and has the correct version" bash -c "protoc --version | grep 'libprotoc ${protobuf_compiler_version}'"

# Common tooling
check "validate git is working and has the correct version" bash -c "git --version | grep '${git_version}'"
check "validate git-lfs is working and has the correct version" bash -c "git lfs version | grep '${git_lfs_version}'"

# Python-related tools (a selected sub-set; others may be added later)
check "validate python3 is working and has the correct version" bash -c "python3 --version | grep '${python_version}'"
check "validate pip3 is working and has the correct version" bash -c "pip3 --version | grep '${python_version}'"
check "validate black is working and has the correct version" bash -c "black --version | grep '${python_version}'"
# cannot grep versions as they do not match the Python version
check "validate virtualenv is working" bash -c "virtualenv --version"
check "validate flake8 is working" bash -c "flake8 --version"
check "validate pytest is working" bash -c "pytest --version"
check "validate pylint is working" bash -c "pylint --version"

# Bazel-related tools
check "validate bazelisk is working and has the correct version" bash -c "bazelisk version | grep '${bazelisk_version}'"
check "validate bazel is working and has the correct version" bash -c "bazel version | grep '${bazel_version}'"
check "validate buildifier is working and has the correct version" bash -c "buildifier --version | grep '${buildifier_version}'"
check "validate starpls is working and has the correct version" bash -c "starpls version | grep '${starpls_version}'"
check "validate bazel-compile-commands is working and has the correct version" bash -c "bazel-compile-commands --version 2>&1 | grep '${bazel_compile_commands_version}'"

# Qemu target-related tools
check "validate qemu-system-aarch64 is working and has the correct version" bash -c "qemu-system-aarch64 --version | grep '${qemu_system_arm_version}'"
check "validate sshpass is working and has the correct version" bash -c "sshpass -V | grep '${sshpass_version}'"
