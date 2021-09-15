#!/usr/bin/env bash
set -u

DIVERGED=$(git merge-base --fork-point origin/master > /dev/null; echo $?)

if [[ "${DIVERGED}" == 0 ]]; then
  if [[ "${BUILDKITE_TAG}" == "" ]]; then
    if [[ "${BUILDKITE_BRANCH}" == "master" ]]; then
      CI_BYPASS=$(git diff --name-only HEAD~1 | sed -rn '/^(CODE_OF_CONDUCT.md|CONTRIBUTING.md|README.md|SECURITY.md|\.all-contributorsrc|\.github\/.*|docs\/.*|examples\/.*)/!{q1}' && echo true || echo false)
    else
      CI_BYPASS=$(git diff --name-only `git merge-base --fork-point origin/master` | sed -rn '/^(CODE_OF_CONDUCT.md|CONTRIBUTING.md|README.md|SECURITY.md|\.all-contributorsrc|\.github\/.*|docs\/.*|examples\/.*)/!{q1}' && echo true || echo false)
    fi

    if [[ $CI_BYPASS == "true" ]]; then
      cat .buildkite/annotations/bypass | buildkite-agent annotate --style "info" --context "ctx-info"
    fi
  else
    CI_BYPASS="false"
  fi
else
  CI_BYPASS="false"
fi

cat << EOF
env:
  CI_BYPASS: ${CI_BYPASS}

steps:
  - label: ":service_dog: Linting"
    command: "reviewdog -reporter=github-check -filter-mode=nofilter -fail-on-error"
    retry:
      automatic: true
    if: build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.message !~ /\[(skip test|test skip)\]/

  - label: ":hammer_and_wrench: Unit Test"
    command: "authelia-scripts --log-level debug ci --buildkite"
    agents:
      build: "unit-test"
    artifact_paths:
      - "authelia-linux-amd64.tar.gz"
      - "authelia-linux-amd64.tar.gz.sha256"
      - "authelia-linux-arm32v7.tar.gz"
      - "authelia-linux-arm32v7.tar.gz.sha256"
      - "authelia-linux-arm64v8.tar.gz"
      - "authelia-linux-arm64v8.tar.gz.sha256"
      - "authelia-freebsd-amd64.tar.gz"
      - "authelia-freebsd-amd64.tar.gz.sha256"
      - "authelia-public_html.tar.gz"
      - "authelia-public_html.tar.gz.sha256"
    key: "unit-test"
    if: build.env("CI_BYPASS") != "true"

  - wait:
    if: build.env("CI_BYPASS") != "true"

  - label: ":docker: Build Image [coverage]"
    command: "authelia-scripts docker build --arch=coverage"
    agents:
      build: "linux-coverage"
    artifact_paths:
      - "authelia-image-${BUILD_ARCH}.tar.zst"
    depends_on: ~
    env:
      DOCKER_BUILDKIT: "1"
    key: "build-docker-linux-coverage"
    if: build.env("CI_BYPASS") != "true" && build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.message !~ /\[(skip test|test skip)\]/

  - label: ":debian: Package Builds"
    command: ".buildkite/steps/debpackages.sh | buildkite-agent pipeline upload"
    depends_on: ~
    if: build.branch !~ /^(dependabot|renovate)\/.*/ && build.env("CI_BYPASS") != "true"

  - wait:
    if: build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.env("CI_BYPASS") != "true" && build.message !~ /\[(skip test|test skip)\]/

  - label: ":chrome: Integration Tests"
    command: ".buildkite/steps/e2etests.sh | buildkite-agent pipeline upload"
    concurrency: 3
    concurrency_group: "tests"
    depends_on:
      - "build-docker-linux-coverage"
    if: build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.env("CI_BYPASS") != "true" && build.message !~ /\[(skip test|test skip)\]/

  - wait:
    if: build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.env("CI_BYPASS") != "true" && build.message !~ /\[(skip test|test skip)\]/

  - label: ":vertical_traffic_light: Test Concurrency Gate"
    command: "echo End of concurrency gate"
    concurrency: 3
    concurrency_group: "tests"
    if: build.branch !~ /^(v[0-9]+\.[0-9]+\.[0-9]+)$\$/ && build.env("CI_BYPASS") != "true" && build.message !~ /\[(skip test|test skip)\]/
EOF