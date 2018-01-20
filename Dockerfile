FROM debian:stable-slim

COPY mjs/mjs/build/mjs /bin/mjs

ENTRYPOINT [ "mjs" ]
