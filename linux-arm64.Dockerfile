FROM hotio/mono@sha256:b2d2ddde6848d68d8e08448f4182cf8e7a02fca3890f2dabd2323a77738769b2

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7878

# https://github.com/Radarr/Radarr/releases
ARG RADARR_VERSION=0.2.0.1450

# install app
RUN curl -fsSL "https://github.com/Radarr/Radarr/releases/download/v${RADARR_VERSION}/Radarr.develop.${RADARR_VERSION}.linux.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
