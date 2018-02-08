# Alpine Dropbox

A minimal Alpine ([glibc](frolvlad/alpine-glibc)) docker container that runs a headless Dropbox client.

```shell
docker run -d \
--name dropbox \
--restart=unless-stopped \
-v ~/<local-dropbox-storage-dir>:/dbox/Dropbox \
-v ~/<local-dropbox-config-dir>:/dbox/.dropbox \
-e UID=<your-user-id> \
-e GID=<your-group-id> \
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
