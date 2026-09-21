# Laravel Docker Dev - Multi-Project Setup

This is a reusable Docker Compose setup for running multiple Laravel apps using shared PHP, MySQL, and Nginx services.

## Features

- Laravel-ready (PHP 8.3 + Nginx + MySQL)
- Project scaffolding script
- Auto Nginx config and `.test` local domains
- All Laravel projects live under `~/projects/`

---

## 🧱 Requirements

- Docker + Docker Compose
- Composer
- Linux (tested on Ubuntu)
- Laravel installer (optional)

---

## 🏁 Setup

```bash
git clone https://github.com/dallanj/laravel-docker-dev.git
cd laravel-docker-dev
./create-laravel-project.sh example
