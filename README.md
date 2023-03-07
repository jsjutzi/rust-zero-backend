# Rust Newsletter API Service

This is a scalabe, fault-tolerant backend api service built in Rust that allows users to subscribe to a newsletter, confirm that subscription via a unique confirmation link sent to their email, then receive published newsletters.

There is also an admin interface allows admin accounts to login, type and publish newsletters to subscribers, and reset their password if needed.  

Authentication is session-based, we ensure request uniqueness with idempotency keys, and data integrity is achieved through transactionality and atomic principles.    

## Pre-requisites

You'll need to install:

- [Rust](https://www.rust-lang.org/tools/install)
- [Docker](https://docs.docker.com/get-docker/)

There are also some OS-specific requirements.

### Windows
  
```bash
cargo install -f cargo-binutils
rustup component add llvm-tools-preview
```

```
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
```

### Linux

```bash
# Ubuntu 
sudo apt-get install lld clang libssl-dev postgresql-client
# Arch 
sudo pacman -S lld clang postgresql
```

```
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
```

### MacOS

```bash
brew install michaeleisel/zld/zld
```

```
cargo install --version="~0.6" sqlx-cli --no-default-features --features rustls,postgres
```

## How to build

Launch a (migrated) Postgres database via Docker:

```bash
./scripts/init_db.sh
```

Launch a Redis instance via Docker:

```bash
./scripts/init_redis.sh
```

Launch App:

```bash
cargo run
```

You can now try with opening a browser on http://127.0.0.1:8000/login.

There is a default `admin` account with password
`everythinghastostartsomewhere`. The available entrypoints are listed in
[src/startup.rs](https://github.com/jsjutzi/rust-zero-backend/blob/master/src/startup.rs#L62)

## How to test

Launch a (migrated) Postgres database via Docker:

```bash
./scripts/init_db.sh
```

Launch a Redis instance via Docker:

```bash
./scripts/init_redis.sh
```

Launch `cargo`:

```bash
cargo test 
```

These planned contributions and enhancements are currently paused indefinitely due to time constraints:

    1. Implementation of load testing
    2. Implementation of expiration mechanism for Idempotency keys.
    3. Swagger API documentation
    4. Rustdoc implementation
