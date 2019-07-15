# Pathway-Tools Docker

Docker files and instructions for setting up a web install of Pathway tools

The Docker image is based on Ubuntu:latest, updated to have the required support libraries. Currently, the Dockerfile assumes that it is installing version 23.0 of the pathway tools, and expects you to provide the **pathway-tools-23.0-linux-64-tier1-install** installer in the pathway-tools directory.

There's an installation script which feeds the answers to the tool installer, **install-pathway-tools.sh**. This is run by Docker when it builds the image. It also has the name of the installer hard-coded.

Build the container with the following command:

```
docker build -t pathway:23.0 .
```

The container will use a script for running the service automatically, **run-pathway-tools.sh**. It uses Xvfb to provide a headless X11 display to satisfy need for X11 in a server process. You can run the container with this command:

```
docker run --volume `$pwd:/mnt --publish 1555:1555 --rm --name pathway -it pathway:21.0
```

Then, if you visit http://localhost:1555 on your host machine, you should see the pathway tools website.

Change the **ptools-init.dat** file if you need to modify the configuration, then rebuild the container.

---

## Some instructions for headless x-server

Basically, install pathway tools in the container and run the web server with

```
pathway_tools -www
```

This will launch a webservice and an x-server. The webservice will use port 1555. When you run the Dockerfile, map this port to a standard port like 80.

```
docker run -p 1555:80 -v <your_pgdbs_folder>:/pathway_tools/aic_export/pgdbs/ -t <container_tag>
```

---
