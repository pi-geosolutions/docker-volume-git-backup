FROM debian:stretch

MAINTAINER fvanderbiest "francois.vanderbiest@gmail.com"

RUN apt-get update && \
    apt-get install -y git inotify-tools && \
		rm -rf /var/lib/apt/lists/* /usr/share/doc/* /usr/share/man/*

COPY scripts/*.sh /
RUN chmod +x /entrypoint.sh

VOLUME [ "/var/local/data" ]
WORKDIR /var/local/data

ENV REMOTE_BRANCH master
# UID of owner of the folder
ENV FILES_OWNER_UID 999
ENV FILES_OWNER_GID 999

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["bash", "-l", "/run.sh"]
