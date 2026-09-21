# infrastructure-template

Reusable infrastructure template for bootstrapping new projects with Docker Compose and Ansible.

> [!WARNING]
> Examples in this repository are placeholders. This template is **not production-ready** until you review, secure, and adapt it for your environment.

## Use this template

1. Click **Use this template** on GitHub and create a new repository.
2. Clone your new repository.
3. Copy `.env.example` to `.env` and replace placeholder values.
4. Update `ansible/inventory.ini` and `config/applications.tsv`.
5. Run:
   ```bash
   ./scripts/deploy.sh
   ./scripts/healthcheck.sh
   ```

## Repository overview

| Path | Purpose |
| --- | --- |
| `compose/` | Docker Compose services for local/runtime platform components |
| `ansible/` | Inventory, playbooks, and Ansible dependency definitions |
| `config/` | Example app mapping data for deployment workflows |
| `scripts/` | Helper scripts for deploy, healthcheck, and backups |
| `secrets/` | Documentation-only directory for local/encrypted secret workflows |
| `.env.example` | Placeholder environment configuration |
| `.sops.yaml` | Example SOPS policy scaffold (replace recipients before use) |

## Prerequisites

- Docker and Docker Compose plugin
- Bash
- Ansible 2.15+ (or compatible ansible-core)
- Optional: `sops` and a managed key workflow

## Pre-deployment security checklist

- [ ] `.env` values are replaced with project-specific secure values.
- [ ] `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD` are strong, non-placeholder credentials.
- [ ] Inventory hosts/users are real values for your environment (no example placeholders).
- [ ] No plaintext credentials, keys, or tokens are committed.
- [ ] If storing encrypted secrets in-repo, SOPS recipients are your own team keys and workflow is approved.
- [ ] External secret manager usage is defined for production.

## Local validation commands

Run before opening pull requests:

```bash
bash -n scripts/*.sh
ansible-playbook --syntax-check -i ansible/inventory.ini ansible/playbooks/site.yml
```

If `shellcheck` is installed locally:

```bash
shellcheck scripts/*.sh
```

## Secrets handling

- Create your own local `secrets/` files as needed.
- Never commit plaintext secrets.
- Do not commit encrypted secrets unless your team explicitly supports safe encrypted-storage workflows.
- Prefer external secret managers for production.
