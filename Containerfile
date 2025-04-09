ARG BASE_IMAGE_REGISTRY=quay.io/centos-bootc/centos-bootc
ARG BASE_IMAGE_TAG=stream10
ARG BASE_IMAGE_DIGEST=sha256:3765fecf1b46b686a139198f1a6a1da4f4daf33ff44ac05840bda1e09a8257e2
FROM ${BASE_IMAGE_REGISTRY}:${BASE_IMAGE_TAG}@${BASE_IMAGE_DIGEST}

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
