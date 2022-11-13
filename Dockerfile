# Use latest stable Rust release
FROM rust:1.65.0

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

ENV APP_ENVIRONMENT production

# When 'docker run' is executed, launch the binary!
ENTRYPOINT [ "./target/release/zero2prod" ]