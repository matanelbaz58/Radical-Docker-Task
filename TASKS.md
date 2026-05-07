# Tasks

## Completed

- Setup Docker container with Radicale.
- Mount Radicale config externally with `./config:/config`.
- Mount Radicale data externally with `./data:/data`.
- Expose port `5232`.
- Use a small Alpine-based Python image.
- Use environment variables for initial username and password.
- Generate a bcrypt htpasswd file for Radicale login.
- Ignore local credentials, generated users, and data files in Git.

## To Do

- Pin the Radicale package version in the Docker build.
- Add support for separate stable and latest test builds.
- Add registry publishing instructions.
- Push the container image to Docker Hub, GitHub Container Registry, or another registry.
- Add a Docker Compose healthcheck.
- Add backup and restore instructions for `data/collections`.
- Add HTTPS or reverse proxy documentation.
- Add more complete README examples for common clients.

## Removed From Scope

- Kubernetes deployment files.
- Kubernetes service files.
- Kubernetes persistent volume files.

## Beneficial Improvements

- Use Docker build arguments for `RADICALE_VERSION`.
- Add a `.env.example` check in documentation before startup.
- Add Makefile commands for common actions.
- Add CI to build the Docker image.
- Add automated image scanning.
- Add a release process for image tags.
- Add a troubleshooting section for CalDAV/CardDAV client setup.
