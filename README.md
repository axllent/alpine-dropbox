# README

```shell
docker run -d \
--name dropbox \
--restart=unless-stopped \
-v ~/Dropbox:/dbox/Dropbox \
-v ~/.dropbox:/dbox/.dropbox \
-e UID 1000 \
-e GID 1000 \
axllent/alpine-dropbox
```
