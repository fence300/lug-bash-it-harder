# Hackforge LUG - Bash Basics

This is part of a workshop that was hosted at [Hackforge](https://hackf.org) as part of the Linux User Group.

> [!IMPORTANT]
> Don't use this container in production environments. It should only be used for educational purposes.

```bash
podman run -it --rm ghcr.io/taar/lug-bb
```

Run the following command if you want to modify the script while within the bash environement (this might only work on Linux):

```bash
podman run -it --rm -v "<repo>/scripts:/home/gnuplususer/lug/scripts" ghcr.io/taar/lug-bb
# From the root of this repo
cd scripts && podman run -it --rm -v "$PWD:/home/gnuplususer/lug/scripts" ghcr.io/taar/lug-bb
```

## Build Container locally

```bash
podman build . -t lug-bb:latest
```

## Run the Container

```bash
# if built locally
podman run -it --rm lug-bb
```
