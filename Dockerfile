# Docker File for qemu-arm
FROM debian:latest
MAINTAINER Stefan Moll <stefan@stefaus.de>

# install packages
RUN apt-get update && apt-get install -y libjpeg62 libcurl3-gnutls libglib2.0-0 libnuma-dev libncurses5 libpixman-1-0 libmpc3 make netcat telnet python-dev

# Files
COPY arm /home/mi/linnert/arm
COPY arm/lib/libpng12.so.0 /usr/lib
COPY bash_history /root/.bash_history
COPY qemu-asprak /home/mi/linnert/arm/bin

# Set the working directory
WORKDIR /home/mi/linnert/arm/workspace

# include bin
ENV PATH="/home/mi/linnert/arm/bin:${PATH}"

EXPOSE 444

CMD ["bash"]
