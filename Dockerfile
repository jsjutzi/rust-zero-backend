# Use latest stable Rust release

# Builder stage
FROM rust:1.65.0 AS builder

# Let's switch working directory to "app" (equivalent to 'cd app')
# The 'app' folder will be created for us by Docker in case it does not exist already
WORKDIR /app

# Install the required system dependencies for linking configuration
RUN apt update && apt install lld clang -y

# Copy all files from working environment to Docker image
COPY . .

# Use saved metadata instead of querying for live database
ENV SQLX_OFFLINE true

# Build the binary
# We'll use the release profile to make it fast
RUN cargo build --release

# Runtime stage
FROM debian:bullseye-slim AS runtime

WORKDIR /app
# Install OpenSSL - it is dynamically linked by some of our dependencies
# Install ca-certificates - it is needed to verify TLS certificates
# when establishing HTTPS connections
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends openssl ca-certificates \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
    
COPY --from=builder /app/target/release/zero2prod zero2prod
COPY configuration configuration
ENV APP_ENVIRONMENT production
ENTRYPOINT ["./zero2prod"]