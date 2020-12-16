FROM alpine
RUN apk -U add \
	bind-tools \
	busybox-extras \
	curl \
	git \
	mtr \
	sudo \
	tcpdump \
	vim \
	wget \
	htop \
	fish \
	util-linux \
	ripgrep \
	fd

RUN wget -O /usr/bin/httpstat https://github.com/davecheney/httpstat/releases/download/v1.0.0/httpstat-linux-amd64-v1.0.0 && \
	chmod +x /usr/bin/httpstat

RUN echo "Set disable_coredump false" | tee -a /etc/sudo.conf

RUN git clone https://github.com/caarlos0/dotfiles.fish ~/.dotfiles
RUN git config --global dotfiles.managed true && \
	git config --global user.name "Carlos A Becker" && \
	git config --global user.email "null@carlosbecker.dev"

SHELL ["fish", "--command"]
ENTRYPOINT ["fish"]
RUN sed -i'' 's;/bin/ash;/usr/bin/fish;g' /etc/passwd

# fake it
RUN touch /bin/chsh && chmod +x /bin/chsh

RUN cd ~/.dotfiles && \
	./script/bootstrap.fish

# TODO
# RUN wget -O /usr/bin/hey https://storage.googleapis.com/jblabs/dist/hey_linux_v0.1.2 && \
# 	chmod +x /usr/bin/hey
