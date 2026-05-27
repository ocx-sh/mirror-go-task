# mirror-go-task

OCX mirror for [Task](https://github.com/go-task/task). Publishes GitHub
releases to `ocx.sh/go-task` with cascade tags after a smoke test per
`(version, platform)`.

## Editing

| File | Edit | Regenerate after |
|------|------|------------------|
| `mirror.yml` | hand | `ocx-mirror pipeline generate ci` |
| `tests/smoke.star` | hand | — |
| `metadata.json`, `CATALOG.md`, `logo.svg` | hand | — |
| `.github/workflows/*.yml` | generated | re-run when `mirror.yml` changes |

CI fails on drift via `ocx-mirror pipeline generate ci --check`.

## Required secrets

| Secret | Use |
|--------|-----|
| `OCX_MIRROR_REGISTRY_TOKEN` + `OCX_MIRROR_REGISTRY_USER` | `ocx package push` to `ocx.sh` |
| `OCX_MIRROR_DISCORD_HOOK` | notify-stage Discord webhook URL |

## License

Apache-2.0 — see [`LICENSE`](LICENSE). Upstream assets (Task logo, mirrored
binaries) are out of scope; see [`NOTICE.md`](NOTICE.md).
