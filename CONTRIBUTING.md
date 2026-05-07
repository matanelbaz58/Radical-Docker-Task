# Contributing

## Goal

Keep this project simple, documented, and easy to run with Docker Compose.

## Local Development

1. Create `.env` from `.env.example`.
2. Set a real `RADICALE_PASSWORD`.
3. Start the service:

```bash
docker compose up --build
```

4. Test login at:

```text
http://localhost:5232
```

## Documentation Rules

- Update `README.md` when behavior changes.
- Update `INSTALL.md` when setup steps change.
- Update `TASKS.md` when task status changes.
- Do not document secrets or real passwords.

## Git Rules

Do not commit:

- `.env`
- `data/`
- `config/users`

These files are local, generated, or sensitive.

## Docker Changes

When changing Docker behavior, verify:

- the image builds
- the container starts
- port `5232` is reachable
- login works with `.env`
- data remains under `./data`
- config remains under `./config`

## Security Notes

- Never commit real passwords.
- Prefer bcrypt or stronger password hashing.
- Use HTTPS through a reverse proxy before exposing Radicale outside a trusted local network.

## Pull Request Checklist

- Docker Compose starts successfully.
- Documentation matches the current behavior.
- Sensitive files are not committed.
- The change keeps the image small.
- Any new failure case is documented.
