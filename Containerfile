ARG BASE_IMAGE_REGISTRY=ghcr.io/rsturla-homelab/bootc/qemu/centos-base
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST=sha256:dda598670083ccc1e666824e2bf66ecd1a573aadc5bcaa132e54ce1c54cefe55
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}@${BASE_IMAGE_DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
