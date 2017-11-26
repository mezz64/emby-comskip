FROM plexinc/pms-docker:plexpass

RUN apt-get update && \
    apt-get install -y \
    	git \
	build-essential \
	libargtable2-dev \
	autoconf \
	ffmpeg \
	libtool \
	libavutil-dev \
        libavformat-dev \
        libavcodec-dev &&\

# Build comskip
 git clone git://github.com/erikkaashoek/Comskip /tmp/comskip && \
 cd /tmp/comskip && \
 ./autogen.sh && \
 ./configure \
	--bindir=/usr/bin \
	--sysconfdir=/config/comskip && \
 make && \
 make install && \

# Cleanup
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

COPY root/ /
