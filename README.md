# docker-ijava

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/blue271828/ijava.svg)](https://hub.docker.com/r/blue271828/ijava)



## Usage

This Docker image provides [IJava](https://github.com/SpencerPark/IJava/) environment. You can use it on [Jupyter Notebook](https://github.com/jupyter/notebook) and [Jupyter Console](https://github.com/jupyter/jupyter_console), they run on the container.

So before using this environment, you have to build the image. Please type the following command and create it.

```bash
$ make build
```



## Jupyter Notebook

You can launch Jupyter Notebook as the following. Since a local URL with a token is displayed, open the URL with your browser.

```bash
$ make notebook
```



## Jupyter Console

You can run IJava by Jupyter Console as the following.

```bash
$ make ijava
```

