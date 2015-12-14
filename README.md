# [zobees/docker-7daystodie](https://hub.docker.com/r/zobees/7daystodie/)

An abstract docker container for 7 Days to Die.

**Currently in development and not suitable for general use.**

## Security implications

The 7 Days to Die dedicated server is not available via anonymous login and therefore needs to be authenticated with your Steam username and password prior to installation.

This means you cannot simply pull and run this container, and you should **never push your image to a public registry**.  Instead you should build the image on your docker host directly or store your image in a private **secured and authenticated** registry.

### Usage

The `Dockerfile` contains an `ONBUILD` instruction to download and install the 7 Days to Die dedicated server via `steamcmd`, using the credentials you supply via a `credentials.txt` in the current working directory when you build your image.

The `credentials.txt` should contain a single line:

    login <mysteamuser> <mysteampass>

The `credentials.txt` will be removed from the image during the build, however Steam will still be authenticated using _your_ credentials.  So again, **do not push your image to a public registry.**

### Example

A full example is available [here on GitHub](https://github.com/zobees/docker-7daystodie-example).

## Known issues

 * Using `steam` user causes pain dealing with permissions in the data volume.  This is also an issue in its parent image [zobees/steamcmd-ubuntu](https://hub.docker.com/r/zobees/steamcmd-ubuntu/), which I will fix in the next release.

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
