FROM alpine
RUN apk -U add \
        mtr \
        busybox-extras \
        curl \
        wget \
        tcpdump \
        bind-tools

RUN wget -O /usr/bin/httpstat https://github.com/davecheney/httpstat/releases/download/v1.0.0/httpstat-linux-amd64-v1.0.0 && \
	chmod +x /usr/bin/httpstat
