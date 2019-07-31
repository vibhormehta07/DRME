FROM ubuntu:18.04
MAINTAINER Vibhor Mehta vibhormehta20@gmail.com
RUN apt-get update && apt-get install wget build-essential -y
RUN apt-get install libz-dev && apt-get install zlib1g-dev && apt-get install ghostscript && apt-get install libtool
RUN sudo apt-get install mono-complete
RUN apt-get install r-base
RUN wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz
RUN tar xvzf meme-5.0.5.tar.gz && \
    cd meme-5.0.5 && \
    ./configure --prefix=$HOME/meme --with-url=http://memesuite.org/ --enable-build-libxml2 --enable-build-libxslt && \
    make && make test && \
    make install

