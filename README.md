# info1-notebook
## tryout

I use [Executable Book](https://executablebooks.org/en/latest/) for this.

## Build Docker Image
```
docker build -t jupyterbook .
```

## Run Docker Container
```
docker run -it --name jupyterbook --rm -p 8888:8888 -v "$(pwd)/info1-book:/data/book" jupyterbook
docker run -it --name jupyterbook --rm -v "$(pwd):/data/book" jupyterbook
```
