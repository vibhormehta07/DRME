FROM ubuntu:18.04
MAINTAINER Vibhor Mehta vibhormehta20@gmail.com
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install wget build-essential -y
RUN apt-get install libz-dev -y
RUN apt-get install zlib1g-dev -y 
RUN apt-get install ghostscript -y 
RUN apt-get install libtool -y
RUN apt-get install mono-complete -y
ENV TZ=US/Phoenix
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install r-base -y --no-install-recommends tzdata    
RUN wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz
RUN tar xvzf meme-5.0.5.tar.gz && \
    cd meme-5.0.5 && \
    ./configure --prefix=$HOME/meme --with-url=http://memesuite.org/ --enable-build-libxml2 --enable-build-libxslt && \
    make && make test && \
    make install

