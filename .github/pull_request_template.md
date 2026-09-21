## Summary

<!-- What changed and why? -->

## Validation

- [ ] `bash -n scripts/*.sh`
- [ ] `ansible-playbook --syntax-check -i ansible/inventory.ini ansible/playbooks/site.yml`
- [ ] Other checks run (list below)

## Security review

- [ ] No credentials, keys, tokens, or production identifiers were added
- [ ] `.env`, secret files, and local state remain uncommitted
- [ ] Placeholders remain generic for public template reuse
