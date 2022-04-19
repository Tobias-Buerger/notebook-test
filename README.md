# info1-notebook

I use [Executable Book](https://executablebooks.org/en/latest/) for this.

## Build Docker Image
```
docker build -t jupyterbook .
```

## Run Docker Container
```
docker run -it --name jupyterbook --rm -p 8888:8888 -v "$(pwd)/info1-book:/data/book" jupyterbook 
```