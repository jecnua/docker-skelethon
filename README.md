# Docker skelethon

![status](https://img.shields.io/badge/project_status-active-green.svg)

- [http://label-schema.org/rc1/](http://label-schema.org/rc1/)

## Steps

In order:

- git clone git@github.com:jecnua/docker-skelethon.git <new-directory>
- Remove the .git
- Run 'git init'
- export NAME_REPO="yourrepo/name"
- run run.sh
- [optional] Change DOCKER_IMAGE in env.sh if needed
- Change FROM Image and MAINTAINER in dockerfile
- Source env.sh
- Try to run "make" and check the output
- [optional] Try to run your image
- Delete all on this README

## Build

To build locally:

    $ source env.sh
    $ make

If you didn't commit you will see something like this:

    Successfully built 3312b46407ae
    Docker Image: test/test:0.1-74ae1d8-dirty

To inspect:

    $ docker inspect test/test:0.1-74ae1d8-dirty

## Install

    a_list=(.gitignore Dockerfile Makefile login.sh run.sh)
    for i in ${a_list[@]}; do \
    wget https://raw.githubusercontent.com/jecnua/docker-skelethon/master/$i
    done
