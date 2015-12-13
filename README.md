# Docker | 7 Days to Die

An abstract docker container for 7 Days to Die.

**Currently in development and not suitable for general use.**

## Security implications

The 7 Days to Die dedicated server is not available via anonymous login and therefore needs to be authenticated with your Steam username and password prior to installation.

This means you cannot simply pull and run this container, and you should **never push your built image to a public registry**.  Instead, use one of the following methods to keep your credentials safe:

### Build on your server

The `Dockerfile` contains an `ONBUILD` instruction to download and install the 7 Days to Die dedicated server via `steamcmd`, using the credentials supplied via `credentials.txt` you place in the current working directory of your docker build command.

The `credentials.txt` should contain a single line:

    login <mysteamuser> <mysteampass>

When you run your docker build command, `steamcmd` will authenticate prior to downloading the 7 Days to Die dedicated server, and all will be well.

**This bears repeating: do not push your image to a public registry**.

### Store in a private registry

Rather than building the image on your server each time you create or update a container, you could build as per the instructions above and then store the image in your own private registry, keeping your credentials secure.

Instructions on creating and using a private registry are available in the Docker documentation.

## Disclaimer

These containers are designed to be used by Zobees to host game servers for friends and family, and therefore may not suit all use cases.  That said, we are all for flexibility and would welcome pull requests and issues.
