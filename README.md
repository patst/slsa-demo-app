# SLSA Demo App


Generate self-managed key for cosign: `cosign generate-key-pair`

Build the app:
```bash
pack build patst/slsa-demo-app --publish
```

Sign image:  (needs to be in the registry)
```bash
cosign sign --key cosign.key --key=""  patst/slsa-demo-app
```

=> Signature appears in the registry: https://hub.docker.com/repository/docker/patst/slsa-demo-app/general