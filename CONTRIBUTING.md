# Contributing
## Branches

- `main` always contains a working version and is updated only through pull requests.
- Stage branches: `stage/<number>-<short-name>` (e.g. `stage/1-empty-boot`)
- Documentation branches: `docs/<short-name>` (e.g. `docs/readme`)

## Commit messages

This project follows [Conventional Commits](https://www.conventionalcommits.org/).

Format: `<type>(<scope>): <description>`

Types:
- `feat` – new functionality
- `fix` – bug fix
- `docs` – documentation only
- `build` – build scripts
- `ci` – CI configuration
- `refactor` – restructuring without behavior change
- `chore` – maintenance

Scopes (optional): `boot`, `build`, `docs`, `ci`

Rules: imperative mood ("add", not "added"), lowercase, no period, max ~50 characters.

Example: `feat(boot): print single character via int 10h`

## Pull requests

- Every branch is merged into `main` through a pull request.
- Merge method: **Create a merge commit** (not squash), to keep the full history of each stage.
- PR descriptions follow the template in `.github/PULL_REQUEST_TEMPLATE.md`.
- After merging a stage, tag it on `main`: `v0.1`, `v0.2`, ...

## Building

TBD