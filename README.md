# docker-registry
Registry configuration for MMC deployment

## Configure
Create and custom the three configurations files :
* docker-compose.yml
* conf/registry.yml
* conf/registry-web.yml

And generate private key and certificate :
* conf/auth.key
* conf/auth.cert

Easily create their with that command :
```sh
make install
```

## Deploy
```sh
make start
```

## Stop
```sh
make stop
```
