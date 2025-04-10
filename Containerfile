ARG BASE_IMAGE_REGISTRY=ghcr.io/rsturla-homelab/bootc/qemu/centos-base
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST=sha256:413cc837a42c2963584deda8abe47bd4759fe718d9dfd33ad8ae125e6b898d38
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}@${BASE_IMAGE_DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
