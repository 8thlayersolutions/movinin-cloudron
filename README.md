# Movin' In Cloudron package skeleton

This package skeleton adapts Movin' In for Cloudron phase 1:

- removes the bundled MongoDB runtime dependency
- reads MongoDB settings from Cloudron addon env vars
- maps Movin' In SMTP settings to Cloudron sendmail
- redirects CDN/media storage to `/app/data`
- binds the backend to Cloudron's app port

## What still needs upstream changes

This starter package assumes the upstream backend is the main web process exposed by Cloudron. If you want the separate frontend and admin React builds served from the same Cloudron app, you still need one of these patterns:

1. Serve the built frontend/admin assets from the backend Express app.
2. Add a reverse proxy in-container and run backend + admin + frontend as separate processes.
3. Package backend, admin, and frontend as separate Cloudron apps.

## Expected repository layout

This skeleton assumes the upstream repository root is copied into the package root, with these directories present:

- `backend/`
- `frontend/`
- `admin/`
- `packages/`

## Suggested next patch to upstream

Add a lightweight health endpoint if one does not already exist:

```ts
app.get('/api/health', (_req, res) => res.status(200).json({ ok: true }))
```

## Install loop

```bash
cloudron install
cloudron logs --follow
cloudron exec --app <app-id>
```
