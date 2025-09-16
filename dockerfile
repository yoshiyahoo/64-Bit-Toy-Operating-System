FROM ubuntu:22.04

# Install all the necessary programs
# wget, for installing zig
# nasm, x86 assembler
# mtools, helps with file systems like FAT12, FAT16, FAT32
# xz-utils, file compressor, maybe useful
# qemu-system-x86, virtual x86 machine to test OS
# grub-bin-pc, a grub executible to run a machine on
# xorriso, a tool for creating, modifying, and burning ISO 9660 filesystem images
RUN apt-get update 
RUN apt-get install -y \
	wget \
	build-essential \
	nasm \
	xz-utils \
	qemu-system-x86 \
	mtools \
	grub-common \
	xorriso \
	curl 

# Get a specific version of zig, the latest as of creation being 0.15.1
# B/C zig is a fully fledged package, we don't need to use the package manager and not integrate with with system dependencies
# That's why we cd into the /opt directory, /opt for optional ;)
RUN cd /opt && \
	wget https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz && \
	tar -xf zig-x86_64-linux-0.15.1.tar.xz && \
	ln -s /opt/zig-x86_64-linux-0.15.1/zig /usr/local/bin/zig

WORKDIR /os-workspace

# Keep container running
CMD ["bash"]
