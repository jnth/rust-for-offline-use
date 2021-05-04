#!/bin/bash -x

mkdir -p /opt/rust-local-registry
cargo local-registry --sync Cargo.lock /opt/rust-local-registry
( cd /opt && tar czf rust-local-registry.tar.gz rust-local-registry )
