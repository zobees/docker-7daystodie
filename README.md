# 7daystodie

An abstract docker container for 7 Days to Die.

**Please be aware of breaking changes and potential issues until a 1.x release.**

## Overview

There are a bunch of ways you could use this image, but my current method is to mount a volume on which to store the game, and another on which to store the world data.  It's horses for courses though really, so I can't recommend a particular configuration for your requirements.  There should be enough flexibility for most use cases, though.

## Environment variables

### SDTD_CONFIG_FILE

**Optional.**  The path to your server configuration file.  Optional yes, but an entirely default server probably isn't that much fun in the long run.

### SDTD_TELNET_PORT

**Optional.**  The telnet port of the 7 days to die server.  Set this in your config if you want the server to be shut down gracefully with a `saveworld` and `shutdown` when you stop the container.  The default is `8081`.

### STEAM_APP_BETA

**Optional.**  The beta version to install if desired, e.g. `latest_experimental`.

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
