#!/bin/bash

# usage: ./create-laravel-project.sh example

PROJECT=$1
PROJECT_DIR=~/projects/$PROJECT
NGINX_CONF=nginx/conf.d/$PROJECT.test.conf
DOMAIN="$PROJECT.test"

if [ -z "$PROJECT" ]; then
    echo "❌ Project name required. Usage: ./create-laravel-project.sh my-app"
    exit 1
fi

echo "📁 Creating Laravel project at $PROJECT_DIR..."
composer create-project laravel/laravel "$PROJECT_DIR"

echo "🛠️ Generating Nginx config..."
cp nginx/conf.d/laravel.conf.stub "$NGINX_CONF"
sed -i "s/{{DOMAIN}}/$DOMAIN/g" "$NGINX_CONF"
sed -i "s/{{FOLDER}}/$PROJECT/g" "$NGINX_CONF"

echo "🌐 Adding $DOMAIN to /etc/hosts (requires sudo)..."
echo "127.0.0.1 $DOMAIN" | sudo tee -a /etc/hosts > /dev/null

echo "🚀 Restarting Docker containers..."
docker-compose down && docker-compose up -d

echo "✅ Done! Visit http://$DOMAIN"

