FROM alpine
RUN apk -U add \
        mtr \
        busybox-extras \
        curl \
        wget \
        tcpdump \
        bind-tools
