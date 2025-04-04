FROM ghcr.io/rsturla-homelab/bootc/qemu/centos-base:stream10@sha256:0f0af02ffea5ebfea142aefdf8869cc1d0b502ed9f7beacffde132385920b89f

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
