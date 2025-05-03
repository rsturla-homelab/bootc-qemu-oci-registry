ARG BASE_IMAGE_REGISTRY=ghcr.io/rsturla-homelab/bootc/qemu/centos-base
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST=sha256:124e38d431c587af617bb6ffa70050af05d60f3c0d9025dab389e51493886517
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}@${BASE_IMAGE_DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
