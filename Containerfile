ARG PLATFORM=qemu
ARG IMAGE=ghcr.io/rsturla-homelab/bootc/${PLATFORM}/centos-base
ARG TAG=stream10
ARG DIGEST=sha256:f216454323707217def73759aa92c88646747b328b96d06dee6eec1ae1605160
FROM ${IMAGE}:${TAG}@${DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
