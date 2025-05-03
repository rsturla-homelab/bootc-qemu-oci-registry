ARG BASE_IMAGE_REGISTRY=ghcr.io/rsturla-homelab/bootc/qemu/centos-base
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}${BASE_IMAGE_DIGEST:+@${BASE_IMAGE_DIGEST}}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
