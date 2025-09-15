FROM mcr.microsoft.com/devcontainers/javascript-node:20-bullseye

# Install PostgreSQL client tools
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

# Install global npm packages
RUN npm install -g npm@latest

WORKDIR /workspaces/civall-website-cms