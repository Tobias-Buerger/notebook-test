# info1-notebook

## Build Docker Image
```
docker build -t test .
```

## Run Docker Container
```
docker run -it --rm -p 8888:8888 -v "$(pwd)/notebooks:/data/notebooks" test 
```