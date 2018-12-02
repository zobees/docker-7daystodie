# zobees/7daystodie

A generic docker image for the 7 Days to Die dedicated server.

## Features

 * Installs or updates the server on startup.
 * Drops privileges to a configurable UID and GID.
 * Handles graceful shutdown via the server telnet console.
 * Includes a Docker healthcheck.

## Usage

``` sh
docker run -d -v $PWD/data:/data \
  -p 26900-26902:26900-26902 \
  -p 26900-26902:26900-26902/udp \
  zobees/7daystodie
```

## Configuration

Specify an alternate configuration file via `CONFIG_FILE` (default: serverconfig.xml).

## Other options

See the source code for this and its base image for more information:

 * [zobees/7daystodie](https://github.com/zobees/docker-7daystodie)
 * [zobees/steamcmd](https://github.com/zobees/docker-steamcmd)

## Known issues

 * The wrong server port is displayed in game's server list if non-standard. This is because the server list port is determined by the value the a2s query response and not the port the server is _actually_ running on. A fix for this will be incoming, but for now you can use `QUERY_PORT`.

 * The server seems to stop logging to stdout shortly after running when privileges are dropped.

 * The server can take long enough to start up that the health check reports an unhealthy status.

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
