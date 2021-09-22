FROM node:12.22.1-buster-slim

# Override variables by passing in env vars. Ex. -e AWS_REGION=us-west-2
ENV AWS_REGION="us-east-1"

# Copy over the files that we need
COPY src /app/src
COPY package.json /app/package.json

# Install dependencies
RUN cd /app && npm install

WORKDIR /app/src

# Starts the server & listens on 3000.
CMD node index.js

########################
##### INSTRUCTIONS #####
########################

# Build it locally:
# docker build . -t sample-express-server:latest

# Tag it to a real image that you can push up:
# docker tag sample-express-server:latest <ecr_repo_url>:<tag>

# Push it up to your ECS Repo:
# docker push <ecr_repo_url>:<tag>
