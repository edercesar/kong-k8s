FROM kong:2.3.2-alpine

COPY ./kong.yml /kong/declarative/kong.yml
USER root
RUN apk add curl
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/kong/declarative/kong.yml
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN='0.0.0.0:8001'
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr

EXPOSE 8000/tcp
EXPOSE 8001/tcp
EXPOSE 8443/tcp
EXPOSE 8444/tcp

HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD [ "CMD", "kong", "health" ]
