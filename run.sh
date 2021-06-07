#!/bin/bash

## Create archive with Rust local registry for offline usage
## Usage: ./run.sh [version]

# Read version from command line, without a `v`
version=$1
[ "${version}" == "" ] && version="latest"

uid=$( id -u )
gid=$( id -g )
destination=${HOME}/rust-local-registry-${version}.tar.gz

# Clean existing archive (important!) and other working files
rm -f ${destination} Cargo.lock Dockerfile

# Build Docker image
sed "s/__version__/${version}/" Dockerfile.template > Dockerfile
docker build \
    --build-arg UID=$uid \
    --build-arg GID=$gid \
    --build-arg DATE="$( date )" \
    -t offline-rust-builder:${version} \
    .

# Run container that create archive of Rust local registry
touch ${destination}
docker run -it --rm \
    -v ${destination}:/opt/rust-local-registry.tar.gz \
    --name offline-rust-builder \
    offline-rust-builder:${version}
	
# Clean
rm -f Dockerfile Cargo.lock

echo
echo "=> Creating ${destination}"