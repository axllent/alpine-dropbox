# Alpine Dropbox

A minimal Alpine ([glibc](frolvlad/alpine-glibc)) docker container that runs a headless Dropbox client.

```shell
docker run -d \
--name dropbox \
--restart=unless-stopped \
-v ~/<local-dropbox-storage-dir>:/dbox/Dropbox \
-v ~/<local-dropbox-config-dir>:/dbox/.dropbox \
-e UID <your-user-id> \
-e GID <your-group-id> \
axllent/alpine-dropbox
```
