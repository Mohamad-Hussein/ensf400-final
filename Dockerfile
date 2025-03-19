FROM alpine:latest

# Install required dependencies
RUN apk add --no-cache \
    openjdk11 \
    bash \
    curl \
    unzip \
    python3 \
    py3-pip

# Set working directory
WORKDIR /app
COPY . /app

# Make Gradle wrapper executable
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build --no-daemon

# Start the application
EXPOSE 8080
ENTRYPOINT ["./gradlew", "apprun"]
