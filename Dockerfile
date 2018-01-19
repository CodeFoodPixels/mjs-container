FROM alpine:latest

COPY mjs/mjs/build/mjs /

ENTRYPOINT [ "./mjs" ]
