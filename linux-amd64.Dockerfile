FROM hotio/mono@sha256:d39de59fbe7c784c66a72283717baa0e367f0caec85cf0cb60e2a32245ff8997

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7878

ARG VERSION

# install app
RUN curl -fsSL "https://radarr.servarr.com/v1/update/develop/updatefile?version=${VERSION}&os=linux&runtime=mono" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
