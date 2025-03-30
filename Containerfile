FROM ghcr.io/rsturla-homelab/bootc/qemu/centos-base:stream10@sha256:d6249f14adc87a43208d163ab2843c7ad07e82c58874778b2d8a9f2bbac665cd

COPY files/ /

RUN for file in /usr/share/containers/systemd/*.image; do \
        ln -s "$file" /usr/lib/bootc/bound-images.d/$(basename "$file"); \
    done
