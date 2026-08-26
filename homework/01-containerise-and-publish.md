# Homework 1: containerise and publish

**Time:** 30 minutes · **AWS services:** none · **Free Tier:** not applicable, everything runs on your own machine

## Goal

Containerise a page, publish its source.

You build a container image that serves one web page, run it locally, publish the source in a
public GitHub repository, then remove the container and the image again.

## Prerequisites

- Docker Desktop installed and running ([Docker Desktop docs](https://docs.docker.com/desktop/))
- git installed ([git docs](https://git-scm.com/doc))
- A GitHub account ([GitHub getting started](https://docs.github.com/en/get-started))

No AWS account is needed. Nothing in this assignment creates a billable cloud resource.

## Steps

1. **Copy `homework/docker-hi-bengaluru/` into a repository.** That folder holds the
   `Dockerfile` and `index.html`. Copy it into a new local git repository, then `git add .` and
   `git commit -m "Containerise a page"`.
2. **`docker build -t hi-ben .`** Run it from inside that folder to turn the `Dockerfile` into
   an image tagged `hi-ben`.
3. **`docker run -dp 8080:80 --name hi-ben hi-ben`** This starts a container from that image in
   the background and publishes its port 80 on your port 8080.
4. **Push it to GitHub, publicly.** Create a public repository on GitHub, then
   `git remote add origin <REPO_URL>` and `git push -u origin main`.

## Artifact

A public GitHub repository containing the `Dockerfile`, plus the local image tag `hi-ben` on
your machine.

## Check it works

```bash
curl -s localhost:8080
```

The command returns the page text, including the line `Hi, Bengaluru`. Opening
`http://localhost:8080` in a browser shows the same page.

## Teardown

```bash
docker rm -f hi-ben
docker image rm hi-ben
```

The first command stops and removes the container, the second removes the image.

## Check teardown worked

```bash
docker ps -a
docker images
```

Neither listing shows anything for `hi-ben`: no container with that name, no image with that
tag. The GitHub repository stays, on purpose — it is the artifact you keep.

## If something goes wrong

- `docker build` cannot find the `Dockerfile`: you are in the wrong folder. Run `ls` and check
  that `Dockerfile` and `index.html` are in the current directory.
- `docker: Cannot connect to the Docker daemon`: Docker Desktop is not running. Start it and
  wait for its status to read running, then retry.
- `port is already allocated` on `docker run`: something else uses port 8080. Pick another host
  port, for example `docker run -dp 8081:80 --name hi-ben hi-ben`, and curl that port instead.
- `curl` returns nothing: check the container is up with `docker ps`, then read its logs with
  `docker logs hi-ben`.
- `git push` is rejected: confirm the remote URL with `git remote -v`, and that the branch name
  matches, with `git branch --show-current`.
- `docker image rm` reports the image is in use: remove the container first with
  `docker rm -f hi-ben`, then remove the image again.
