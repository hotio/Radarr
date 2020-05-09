FROM hotio/mono@sha256:b170c146c4f174189dcdb7fd68b1feffd5a59bc5286d60871e8c9306b5f594fb

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 7878

ARG RADARR_VERSION

# install app
RUN curl -fsSL "https://radarr.servarr.com/v1/update/develop/updatefile?version=${RADARR_VERSION}&os=linux&runtime=mono" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    rm -rf "${APP_DIR}/NzbDrone.Update" && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
