FROM rust:1.67-bullseye as building

WORKDIR /usr/src/osaamiskiekko

# Create empty sources just for building the dependencies
COPY Cargo.toml Cargo.lock ./
RUN mkdir -p src/bin; \
  echo "fn main() {}" > src/bin/api.rs; \
  echo "fn main() {}" > src/bin/health.rs

RUN cargo build --release

# Build the application
COPY src src
RUN cargo build --release


# Final image
FROM bitnami/minideb:bullseye

RUN install_packages ca-certificates

COPY --from=building /usr/src/osaamiskiekko/target/release/api /usr/src/osaamiskiekko/target/release/health /usr/local/bin/

WORKDIR /usr/local/bin/
CMD /usr/local/bin/api
