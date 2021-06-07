# Cargo local registry for offline usage

__Created from an article of [hatsunearu].__

We use the official [Rust Docker image] to install `cargo-local-registry`, download and pack all crates for 
an offline usage.


## How

First, update the `Cargo.toml` with the dependencies you want to download.

Then, launch the `run.sh` command to create a Rust local registry in your home directory:

```bash
./run.sh  # use the latest Rust version
./run.sh 1.52.1  # use a specific version
```


## Dependencies

 - Docker (without the use of `sudo`)


[hatsunearu]: https://hatsunearu.github.io/2018/04/29/rust-offline/
[Rust Docker image]: https://hub.docker.com/_/rust