FROM frolvlad/alpine-glibc:alpine-3.10

RUN apk add --no-cache bash curl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
