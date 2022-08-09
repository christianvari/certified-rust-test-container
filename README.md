# certified-rust-test-container
A UBI certified rust container that runs various tests

## Build

```
docker build -t certified-rust-test-container .
```

## Run

```
docker run --rm --name rust-test -v $(pwd):/test certified-rust-test-container
```