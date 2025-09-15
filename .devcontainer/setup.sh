#!/bin/bash

echo "🚀 Setting up CivAll development environment..."

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to start..."
for i in {1..30}; do
    if pg_isready -h localhost -p 5432 -U postgres >/dev/null 2>&1; then
        echo "PostgreSQL is ready!"
        break
    fi
    echo "Waiting for PostgreSQL... ($i/30)"
    sleep 1
done

# Create database (it should already exist from docker-compose, but just in case)
PGPASSWORD=postgres psql -U postgres -h localhost -c "CREATE DATABASE civall;" 2>/dev/null || echo "Database already exists"

# Create project directories if they don't exist
mkdir -p /workspaces/civall-website-cms/cms
mkdir -p /workspaces/civall-website-cms/frontend

# Note: package.json files already exist, so we skip initialization
# The setup files are pre-configured in the repository

# Install dependencies for Strapi
echo "📦 Installing Strapi dependencies..."
cd /workspaces/civall-website-cms/cms
npm install

# Install dependencies for Next.js
echo "📦 Installing Next.js dependencies..."
cd /workspaces/civall-website-cms/frontend
npm install

# Create example .env files if they don't exist
if [ ! -f "/workspaces/civall-website-cms/cms/.env" ]; then
    cat > /workspaces/civall-website-cms/cms/.env << EOL
HOST=0.0.0.0
PORT=1337
APP_KEYS=toBeModified1,toBeModified2,toBeModified3,toBeModified4
API_TOKEN_SALT=tobemodified
ADMIN_JWT_SECRET=tobemodified
TRANSFER_TOKEN_SALT=tobemodified
JWT_SECRET=tobemodified
DATABASE_CLIENT=postgres
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=civall
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
DATABASE_SSL=false
EOL
fi

if [ ! -f "/workspaces/civall-website-cms/frontend/.env.local" ]; then
    cat > /workspaces/civall-website-cms/frontend/.env.local << EOL
NEXT_PUBLIC_STRAPI_URL=http://localhost:1337
NEXT_PUBLIC_SITE_URL=http://localhost:3000
EOL
fi

echo "✅ Setup complete!"
echo ""
echo "To start the development servers:"
echo "  1. Open a terminal and run: cd cms && npm run develop"
echo "  2. Open another terminal and run: cd frontend && npm run dev"
echo ""
echo "Access points:"
echo "  - Strapi Admin: http://localhost:1337/admin"
echo "  - Next.js Site: http://localhost:3000"