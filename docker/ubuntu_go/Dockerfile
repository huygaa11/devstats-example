FROM ubuntu:18.04

# Install locales
RUN apt-get update -y
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

# Install go
RUN apt install golang -y
RUN DEBIAN_FRONTEND=noninteractive apt install git psmisc jsonlint yamllint gcc -y

# Make working directories
RUN mkdir /data; mkdir /data/dev
RUN chmod -R ugo+rw /data/

ENV GOPATH /data/dev
ENV PATH "${GOPATH}/bin:${PATH}"

RUN go get -u golang.org/x/lint/golint && \
	go get golang.org/x/tools/cmd/goimports && \
	go get github.com/jgautheron/goconst/cmd/goconst && \
	go get github.com/jgautheron/usedexports && \
	go get github.com/kisielk/errcheck

# Download and build devstats
RUN cd $GOPATH/src/ && \
	git clone https://github.com/cncf/devstats.git devstats && \
	cd devstats && \
	git checkout ef1ba8f2422dcc0062ca244374218c17c4f625b5 && \
	make && \
	make install

RUN apt-get install -y postgresql-client postgresql sudo gosu

# Download grafana
RUN apt-get install -y vim libfontconfig wget
RUN apt-get update -y
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.4_amd64.deb
RUN sudo dpkg -i grafana_5.2.4_amd64.deb
