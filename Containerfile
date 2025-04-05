FROM ghcr.io/rsturla-homelab/bootc/qemu/centos-base:stream10@sha256:c01fcba1f2ac5b1297e57ff88f136d116ea9014bfad129d33ec44d2e802f8bd8

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
