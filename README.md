# infrastructure-template

Reusable infrastructure template for bootstrapping new projects with Docker Compose and Ansible.

> [!WARNING]
> This repository is a starting point only. Review and adapt all configuration before production use.

## What this template includes

- `compose/docker-compose.yml` with Redis and MinIO services
- `ansible/` baseline inventory and playbook scaffolding
- `scripts/` helper scripts for deploy, health checks, and backups
- `.env.example` placeholder configuration values

## Prerequisites

- Docker and Docker Compose plugin
- Bash (for scripts)
- Ansible 2.15+
- Optional: `sops` for encrypted secrets management

## Quick start

1. Create a repository from this template.
2. Copy `.env.example` to `.env` and replace placeholders.
3. Update `ansible/inventory.ini` and `config/applications.tsv` for your project.
4. Start services:
   ```bash
   ./scripts/deploy.sh
   ```
5. Validate service health:
   ```bash
   ./scripts/healthcheck.sh
   ```

## Configuration and secrets

- Do **not** commit `.env`, private keys, or plaintext credentials.
- Keep runtime secrets in a secure secret manager or encrypted files under `secrets/`.
- If using SOPS, configure recipients in `.sops.yaml` before encryption.

## Using this as a template

- Click **Use this template** on GitHub.
- Rename project-specific values in `.env`, inventory, and application mappings.
- Add your own CI/CD and cloud-specific modules as needed.

## Repository safety

This public template intentionally contains placeholder-only values and no production identifiers.
