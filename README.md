# Cargo local registry for offline usage

We use a Docker image to install `cargo-local-registry`, download and pack all crates for offline use.


1. Build docker image:

    make build

2. Download crates and pack them:

    make run


It's will create an archive `rust-local-registry.tar.gz` in your home directory.

