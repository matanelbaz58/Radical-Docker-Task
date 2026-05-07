# Radical-Docker-Task

Dockerized Radicale server for CalDAV and CardDAV calendars and contacts.

This project builds a small Radicale container, mounts configuration and data from the host, exposes Radicale on port `5232`, and creates the initial login user from environment variables.

## Project Files

- `Dockerfile` builds the Radicale image from `python:3.12-alpine`.
- `docker-compose.yml` runs the container, exposes the port, loads `.env`, and mounts external folders.
- `entrypoint.sh` creates the Radicale user password file and starts Radicale.
- `config/config` contains the external Radicale configuration.
- `.env.example` shows the required environment variables.
- `.gitignore` prevents credentials, generated users, and local data from being committed.

## How It Works

1. Docker Compose builds the image from the local `Dockerfile`.
2. The container starts with values from `.env`.
3. `entrypoint.sh` reads `RADICALE_USER` and `RADICALE_PASSWORD`.
4. The password is hashed with bcrypt.
5. The generated user record is written to `/config/users`.
6. Radicale starts with `/config/config`.
7. Calendar and contact data is stored under `/data/collections`.

The host mounts make these paths persistent:

- `./config:/config`
- `./data:/data`

## Quick Start

Copy the example environment file:

```bash
cp .env.example .env
```

Edit `.env` and set a real password:

```env
RADICALE_USER=admin
RADICALE_PASSWORD=change_this_password
```

Start the service:

```bash
docker compose up --build
```

Open Radicale:

```text
http://localhost:5232
```

Use the username and password from `.env`.

## Documentation

- [Install](INSTALL.md)
- [Tasks](TASKS.md)
- [Contribution](CONTRIBUTING.md)

## Troubleshooting

If the container exits with `RADICALE_PASSWORD is required`, create `.env` from `.env.example` and set `RADICALE_PASSWORD`.

If port `5232` is already used, change the left side of the compose port mapping:

```yaml
ports:
  - "8080:5232"
```

Then open:

```text
http://localhost:8080
```

If login fails, recreate the container after updating `.env`:

```bash
docker compose up --build
```

If data is not saved, check that the local `data` directory exists and Docker can write to it.

## Future Improvements

- Pin the Radicale version for more predictable builds.
- Add separate stable and latest test image builds.
- Add image publishing instructions for Docker Hub or GitHub Container Registry.
- Add a healthcheck to the Docker Compose service.
- Add a reverse proxy example with HTTPS.
- Add backup and restore documentation for `data/collections`.
