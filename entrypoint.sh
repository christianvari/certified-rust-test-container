#!/bin/bash
set -eu

source /root/.cargo/env
cd test

echo -e "Starting the test suite";
echo -e "=======================\n";
echo -e "Searching for CVE in libraries";
cargo audit;
echo -e "=======================\n";
echo -e "Linting the code";
cargo clippy;
echo -e "=======================\n";
echo -e "Running tests";
cargo test --no-fail-fast;
echo -e "=======================\n";
echo -e "Running tests with coverage";
cargo tarpaulin;
echo -e "=======================";
