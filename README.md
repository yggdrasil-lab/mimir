# Project Mimir (Yggdrasil Knowledge Base & Service Wiki)

**Patron:** [[Mimir]] (Wisdom & Knowledge)

## Objective
I am **Mimir**, the keeper of wisdom at the roots of Yggdrasil. I serve the Documentation Portal and Reference Wiki, powered by Quartz v4. My purpose is to provide an always-up-to-date, searchable, and interconnected documentation site for all stacks, services, and reference material across the Yggdrasil ecosystem.

## Architecture & Services
*   **Engine:** Quartz v4 (Static Site Generator).
*   **Method:** Dockerized (`mimir:latest`).
*   **Services:**
    *   **Docs (`docs.${DOMAIN_NAME}`):** Mounts `Areas/90-Infrastructure` read-only. Comprehensive cluster topology, stack reference documents, and operational runbooks.
    *   **Wiki (`wiki.${DOMAIN_NAME}`):** Mounts `References` read-only. Publicly accessible user guides, life administration, procedures, and personal handbooks.
*   **Authentication:** `docs.${DOMAIN_NAME}` is protected via Traefik Authentik forward-auth middleware (`authentik`). `wiki.${DOMAIN_NAME}` is public for easy access from any device and friction-free sharing.

## Setup
### Deployment
Automated via GitHub Actions CI/CD using centralized `yggdrasil-os` deployment tooling.
Manual deployment on **Gaia/Olympus**:

```bash
/tmp/deploy.sh "mimir" docker-compose.yml
```

### Content Editing
1.  Open Obsidian.
2.  Navigate to `Areas/90-Infrastructure/` (for docs) or `References/` (for wiki).
3.  Write or update notes.
4.  The sites update automatically via live read-only volume mounts.

## Directory Structure
*   `docker-compose.yml`: Swarm service definition for `docs` and `wiki`, Authentik middleware, and volume mounts.
*   `quartz.config.ts`: Configuration, theme tokens, and ignore patterns (dynamic `PAGE_TITLE` and `BASE_URL`).
*   `quartz.layout.ts`: Layout components (Explorer, Search, Graph, Table of Contents).


