# n8n Railway Deployment

Welcome to the **n8n Railway Starter Project**!

This repository allows you to deploy your own [n8n](https://n8n.io) instance to [Railway](https://railway.app/) using a Dockerfile and PostgreSQL database.

---

## 🚀 Quick Deploy

You can deploy immediately to Railway using this repository.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/joleksiysurovtsev/n8n-railway)

---

## 📄 Project Structure

```
n8n-railway/
├── Dockerfile
├── .env.example
├── README.md
```

- **Dockerfile** — Production-ready Dockerfile for n8n.
- **.env.example** — Example environment variables configuration.
- **README.md** — Project instructions.

---

## ⚙ Environment Variables

You must set the following environment variables inside Railway:

| Variable | Description | Example |
|:---------|:------------|:--------|
| `N8N_BASIC_AUTH_ACTIVE` | Enable basic auth | `true` |
| `N8N_BASIC_AUTH_USER` | Basic auth username | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | Basic auth password | `supersecurepassword` |
| `N8N_HOST` | Host for n8n | `0.0.0.0` |
| `N8N_PORT` | Port for n8n | `5678` |
| `WEBHOOK_URL` | Public URL for webhooks | `https://your-service.up.railway.app/` |
| `DB_TYPE` | Database type | `postgresdb` |
| `DB_POSTGRESDB_HOST` | Database host | _your Railway DB host_ |
| `DB_POSTGRESDB_PORT` | Database port | `5432` |
| `DB_POSTGRESDB_DATABASE` | Database name | _your Railway DB name_ |
| `DB_POSTGRESDB_USER` | Database user | _your Railway DB user_ |
| `DB_POSTGRESDB_PASSWORD` | Database password | _your Railway DB password_ |
| `GENERIC_TIMEZONE` | (Optional) Set timezone | `Europe/Kiev` |

📌 Copy these from `.env.example` for easy setup!

---

## 🐘 PostgreSQL Setup

Railway allows you to easily add a PostgreSQL plugin:

1. In your Railway project → Click "New" → "Database" → "PostgreSQL".
2. Railway will generate DB credentials.
3. Add them to your project's environment variables.

**Important:**  
n8n **needs a database** for saving workflows, credentials, and executions persistently.

---

## 🌍 Webhooks

Set the correct `WEBHOOK_URL` to ensure webhooks work properly.

Example:

```env
WEBHOOK_URL=https://your-service-name.up.railway.app/
```

Without this, external services might fail to reach your workflows!

---

## 🔐 Security

Basic Authentication is enabled by default via:

```env
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=supersecurepassword
```

Always use **strong passwords** and enable HTTPS if you handle sensitive data!

---

## 🛠 Local Development (Optional)

You can run this project locally with Docker Compose:

```bash
docker-compose up --build
```

Make sure to set environment variables from `.env.example` if running locally.

---

## 📝 License

This project is released under the [MIT License](LICENSE).

---

## ❤️ Credits

- [n8n.io](https://n8n.io) — Free and open workflow automation tool.
- [Railway.app](https://railway.app) — Easy cloud hosting platform.

