FROM hotio/mono@sha256:a1f4a2285c22c954467ad9b20d7c1d463ccb94577467b4231059a30ab829d958

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7878

ARG RADARR_VERSION

# install app
RUN curl -fsSL "https://radarr.lidarr.audio/v1/update/develop/updatefile?version=${RADARR_VERSION}&os=linux&runtime=mono" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
