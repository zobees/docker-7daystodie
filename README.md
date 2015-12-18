# 7daystodie

An abstract docker container for 7 Days to Die.

**Please be aware of breaking changes and potential issues until a 1.x release.**

## Overview

There are several ways you could use this container:

 * Pull and run it.  This would work, but you'd have the default server config and everything would be destroyed with the container.  Good for getting a server up and running with all the defaults, but not much use beyond that.
 * Pull and run it directly with a linked data volume (using `--volumes-from`).  You could then transfer your server config to the data volume, along with the world files.
 * Extend it, adding your config file at build time and whatever other customization you need.

It's horses for courses, really, so I can't recommend a particular configuration for your requirements.  There should be enough flexibility for most use cases, though.

My personal approach (currently) is to mount two data volumes - one for SteamCMD and the server files, and another for my config and world files.  That way I can share the same engine with multiple servers, but keep their worlds separate.

## Environment variables

### STEAM_USERNAME

**Required.**  The Steam username to authenticate with in order to install the server.

### STEAM_PASSWORD

**Required.**  The Steam password to authenticate with in order to install the server.

### SDTD_CONFIG_FILE

**Optional.**  The path to your server configuration file.  Optional yes, but an entirely default server probably isn't that much fun in the long run.  The default is `/home/steam/app/serverconfig.xml`.

## Changelog

 * **0.1.0** Based on new `zobees/steamcmd` image
 * **0.0.4** Expose the recommended port range (26900-26902)
 * **0.0.3** Ensure server is shut down gracefully (saveworld and shutdown)
 * **0.0.2** Using updated zobees/steamcmd-ubuntu image
 * **0.0.1** Initial release

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
