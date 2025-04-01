FROM ghcr.io/rsturla-homelab/bootc/qemu/centos-base:stream10@sha256:299a69c5dfb5f9791e9b9afe4030942cb5e5861dee8df09f6d0be1e6597c5135

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
        ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
    done
