# Alpine Dropbox

## This project has been discontinued!

Dropbox requires glibc, and Alpine Linux does not support glibc without some hackery, resulting in a much larger docker image than was intended. It also does not run reliably.

My suggestion would be to switch to other docker images such as [bnutz/min-ubuntu-dropbox](https://github.com/bnutz/min-ubuntu-dropbox) (based off this project) which uses Ubuntu instead.


## Intro

A minimal Alpine ([glibc](https://hub.docker.com/r/frolvlad/alpine-glibc/)) docker container that runs a headless Dropbox client.

## Quickstart

```shell
docker run -d \
--name dropbox \
--restart=unless-stopped \
-v /path/to/localfolder:/dbox/Dropbox \
-v /path/to/localconfigfolder:/dbox/.dropbox \
axllent/alpine-dropbox
```

The first time the container is run it downloads the latest version of the Dropbox client. There is no updater script, so if you need to update the Dropbox client then simply remove the container and add it again.

## Authorise the client

The first time you run you will need to authorise the Dropbox client.

## Authorise the client

The first time you run you will need to authorise the Dropbox client.

After starting your container, run `docker logs dropbox -f` and wait until you see something like:

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=48fb804e2fa486b152db480a36ef5923 to link this device.
```

Open that link in your browser and authorise the client to access your dropbox.


## Running as custom user/group

The image will by default run with user/group id of 1000. You can change this to suit your current user by adding the `UID` & `GID` environment variables.

```shell
docker run -d \
--name dropbox \
--restart=unless-stopped \
-v /path/to/localfolder:/dbox/Dropbox \
-v /path/to/localconfigfolder:/dbox/.dropbox \
-e UID=1001 \
-e GID=1001 \
axllent/alpine-dropbox
```

## Interacting with dropbox-cli

Dropbox commands should be run as the `dbox` user:

```shell
docker exec -it -u dbox dropbox dropbox-cli help
```

Any custom configuration that is supported by the dropbox-cli can be modified this way.

## Dropbox status

The current Dropbox status can be seen in the docker log. It refreshes every second and only outputs data when the data changes as not to spam the log with irrelevant info.

```shell
docker logs dropbox -f
```
