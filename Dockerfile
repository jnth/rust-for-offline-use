FROM rust:1.51
ARG UID
ARG GID
RUN apt-get update && apt-get install -y build-essential libssl-dev && rm -rf /var/lib/apt/lists/*
RUN cargo install cargo-local-registry
WORKDIR /app
COPY . .
# To avoid cache
ARG DATE
RUN cargo update
RUN chmod +x offline-build.sh
ENTRYPOINT ["./offline-build.sh"]
