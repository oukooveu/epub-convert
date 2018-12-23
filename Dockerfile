FROM alpine:latest

RUN apk update && apk add calibre

RUN mkdir -p /books
ADD . /books

ENTRYPOINT ebook-convert /books/
