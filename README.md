# Alpine Dropbox

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

## Configuration
The first time you run you will need to authorise your client.

After starting your container, run `docker logs dropbox -f` and wait until you see something like:

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=48fb804e2fa486b152db480a36ef5923 to link this device.
```
Open that link in your browser and authorise the client to access your dropbox.


## Custom user/group id

The image will by default run with user/group id 1000. You can change this to suit your current user by adding the `UID` & `GID` environment variables.

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
