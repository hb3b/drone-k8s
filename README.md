# drone-k8s
Simple plugin to deploy a bunch manifests to K8s.

## Examples
```
- name: deploy
  image: hb3b/drone-k8s:v3
  settings:
    namespace: officeit
    server: https://api.prod.cluster.com
    kubetoken:
      from_secret: kubetoken
  when:
    event:
    - push
```

Environment variables that begin with `DRONE_` are substituted with their values from the CI run.

```
Pod definition:

      containers:
      - name: server
        image: ecr.us-east-1.amazonaws.com/app:release-${DRONE_COMMIT_SHA}

```
