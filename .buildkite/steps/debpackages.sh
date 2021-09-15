#!/usr/bin/env bash
set -eu

for DEB_PACKAGE in amd64 armhf arm64; do
cat << EOF
  - label: ":debian: Build Package [${DEB_PACKAGE}]"
    command: "debhelper.sh"
    artifact_paths:
      - "*.deb"
      - "*.deb.sha256"
    env:
      PACKAGE: "${DEB_PACKAGE}"
    depends_on:
      - "unit-test"
    key: "build-deb-package-${DEB_PACKAGE}"
EOF
done