FROM ghcr.io/rsturla-homelab/bootc/qemu/centos-base:stream10@sha256:55cc482cb244a3d2ffa23dc75180357f430c2a1d83407efeb39ca7b2e106cb38

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
  ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
  done
