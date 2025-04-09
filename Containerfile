ARG BASE_IMAGE_REGISTRY=ghcr.io/rsturla-homelab/bootc/qemu/centos-base
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST=sha256:55cc482cb244a3d2ffa23dc75180357f430c2a1d83407efeb39ca7b2e106cb38
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}@${BASE_IMAGE_DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
