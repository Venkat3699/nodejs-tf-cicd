# Node.js DevOps API with PostgreSQL

This project demonstrates a containerized Node.js RESTful API integrated with a PostgreSQL database using Docker and Docker Compose. It follows infrastructure-as-code, CI/CD, and DevOps best practices.

---

## 🛠️ Features

- Simple Express-based REST API
- PostgreSQL integration
- Dockerized application
- Environment-based configuration using `.env`
- Docker Compose setup for multi-container orchestration
- Security best practices (non-root user, minimal image)

---

## Docker Setup

1. Build Docker Image
```
docker build -t nodejs-app .
```
2.  Run Container
```
docker run -d -p 3000:3000 --name nodejs-app --env-file .env nodejs-app
```

## Docker Compose Setup (Recommended)
1. Start Application
```
docker-compose up -d
```
2. Testing Database
```
docker exec -it <postgres_container_id> psql -U admin -d mydb
```
3. Stop Services
```
docker-compose down
```

## API Endpoints
| Method | Endpoint | Description             |
|--------|----------|-------------------------|
| GET    | /health  | Health check            |
| GET    | /hello   | Returns greeting message|
| GET    | /        | Welcome message         |

