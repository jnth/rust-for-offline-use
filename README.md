# Cargo local registry for offline usage

__Made from an article of [hatsunearu].__

We use a Docker image to install `cargo-local-registry`, download and pack all crates for offline use.

First, update the `Cargo.toml` with the dependencies you want to download and
launch the `run.sh` command to create a Rust local registry in your home directory.

```bash
./run.sh  # use the latest Rust version
./run.sh 1.52.1  # use a specific version
```

[hatsunearu]: https://hatsunearu.github.io/2018/04/29/rust-offline/
