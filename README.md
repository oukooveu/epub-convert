# epub-convert

Convert all e-book files in given directory to choosen format (mobi by default).

## Build
```
docker build -t epub-convert:latest .
```

## Run
```
docker run --rm -v $(pwd)/books:/books epub-convert
```

### Options
- `--force` -- remove file if it was converted already;
- `--format <format>` -- convert to format, default is 'mobi'.
