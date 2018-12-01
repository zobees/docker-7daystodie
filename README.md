# zobees/7daystodie

A generic docker image for the 7 Days to Die dedicated server.

## Usage

``` sh
docker run -d -v $PWD/data:/data \
  -p 26900-26902:26900-26902 \
  -p 26900-26902:26900-26902/udp \
  zobees/7daystodie
```

## Advanced

#### Configuration file

Specify an alternate configuration file via `CONFIG_FILE` (default: serverconfig.xml).

#### Other options

See the source code for this and its base images for more information:

 * [zobees/7daystodie](https://github.com/zobees/docker-7daystodie)
 * [zobees/steamcmd](https://github.com/zobees/docker-steamcmd)
 * [zobees/steamcmd-base](https://github.com/zobees/docker-steamcmd-base)

## Changes

### 0.2.2

 * Improved health check.
 * Improved graceful shutdown.
 * Swapped out telnet for netcat.

### 0.2.1

 * Switched to updated zobees/steamcmd image.
 * Added health check.
 * Added graceful shutdown.

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
