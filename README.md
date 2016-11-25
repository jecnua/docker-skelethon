# Docker skelethon

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
