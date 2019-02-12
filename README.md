# docker-ijava



## Usage

This Docker image provides [IJava](https://github.com/SpencerPark/IJava/) environment. You can use IJava environments by [Jupyter Notebook](https://github.com/jupyter/notebook) and [Jupyter Console](https://github.com/jupyter/jupyter_console) that are running on the container.

Before using the environment, you should build the Docker image. Please type `make build` and creating the container image.

```bash
$ make build
```



## Jupyter Notebook

You can launch Jupyter Notebook by inputting as the following. Since the local URL with a token is displayed, please open the URL with your browser.

```bash
$ make notebook
```



## Jupyter Console

You can run IJava by Jupyter Console by inputting as the following.

```bash
$ make ijava
```

