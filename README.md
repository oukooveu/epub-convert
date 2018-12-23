# epub-convert

## Build
```
docker build -t epub-convert:latest .
```

## Run
```
docker run --rm -v $(pwd)/books:/books oukooveu/epub-convert
```

### Options
- `--force` -- remove file if it was converted already;
- `--format <format>` -- convert to format, default is 'mobi'.
