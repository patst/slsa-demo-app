# SLSA Demo App

Generate self-managed key for cosign: `cosign generate-key-pair`

Build the app:
```bash
pack build patst/slsa-demo-app --publish
```


Sign image: (needs to be in the registry)
```bash
cosign sign patst/slsa-demo-app 
```

=> Signature appears in the registry: https://hub.docker.com/repository/docker/patst/slsa-demo-app/general

Verify image signature:
```bash
 cosign verify patst/slsa-demo-app  --certificate-identity=<email> --certificate-oidc-issuer=https://github.com/login/oauth
 
# see the signatures:
cosign tree patst/slsa-demo-app
```
Check the Log Index Entry at: https://search.sigstore.dev/


## GitHub Actions build

- create a new tag
- check the links in the Github Actions for the Go build + the docker file of the last build

Display the signature for a specific image:
```bash
cosign tree  ghcr.io/patst/slsa-demo-app:0.0.2@sha256:69c7ac153cf48b22d7545d1a3368e2f39e0b7b000a85fb8f2b433838571e11ae  

echo "Downloading the attestation"
cosign download attestation  ghcr.io/patst/slsa-demo-app:0.0.2@sha256:69c7ac153cf48b22d7545d1a3368e2f39e0b7b000a85fb8f2b433838571e11ae | jq -r '.payload' | base64 -d | jq
```


# Runtime demo

* show the manifests:
  * first the kyverno policy


