# Secrets directory guidance

This repository is public. Never commit real credentials, private keys, or production secret material.

## Recommended usage

- Create local secret files in this directory for development-only workflows.
- Keep plaintext secret files untracked.
- If your workflow supports encrypted-in-repo secrets, use SOPS with your own recipients configured in `.sops.yaml`.
- Prefer external secret managers (for example, cloud secret stores or Vault) for production.

## Important

- Do not copy production secrets into this template repository.
- Do not commit encrypted secret files unless your team has explicitly approved and documented a safe encrypted-storage workflow.
