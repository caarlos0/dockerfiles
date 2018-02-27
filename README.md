# dockerfiles

## `debug.dockerfile` -> `caarlos0/debug`

Image to debug networking issues mostly, great to run on kubernetes:

```console
kubectl run -i -t debug --rm --image=caarlos0/debug --restart=Never
```

I was tired of running ubuntu and `apt-get update` and `apt-get install` and
forgetting the package names and all that.
