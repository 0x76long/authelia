# ===================================
# ===== Authelia official image =====
# ===================================
FROM alpine:3.14.2

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY LICENSE .healthcheck.env entrypoint.sh healthcheck.sh ./

COPY authelia-${TARGETOS}-${TARGETARCH} ./authelia

RUN \
chmod 0666 /app/.healthcheck.env

RUN \
apk --no-cache add ca-certificates su-exec tzdata

EXPOSE 9091

VOLUME /config

# Set environment variables
ENV PATH="/app:${PATH}" \
    PUID=0 \
    PGID=0

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["--config", "/config/configuration.yml"]
HEALTHCHECK --interval=30s --timeout=3s --start-period=1m CMD /app/healthcheck.sh
