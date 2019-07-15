# Pathway-Tools Docker

Docker files and instructions for setting up a web install of Pathway tools

The Docker image is based on Ubuntu:latest, updated to have the required support libraries. Currently, the Dockerfile assumes that it is installing version 23.0 of the pathway tools, and expects you to provide the **pathway-tools-23.0-linux-64-tier1-install** installer in the current directory.

There's an installation script which feeds the answers to the tool installer, **install-pathway-tools.sh**. This is run by Docker when it builds the image. It also has the name of the installer hard-coded.

Build the container with the following command:

´´´
docker build -t pathway:23.0 .
´´´
