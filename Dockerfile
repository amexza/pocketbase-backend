# Use a very small Linux system
FROM alpine:latest

# Create a working directory
WORKDIR /pb

# Copy the pocketbase file from your computer to the container
COPY pocketbase /pb/pocketbase

# Give permission to run the file
RUN chmod +x /pb/pocketbase

# Open port 8090 (PocketBase's default port)
EXPOSE 8090

# Force delete data on start (Good for Free Plan testing)
CMD sh -c "rm -rf /pb/pb_data/* && /pb/pocketbase serve --http 0.0.0.0:8090"