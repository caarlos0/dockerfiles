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
	redis \
	fd

RUN wget -O /usr/local/bin/httpstat https://github.com/davecheney/httpstat/releases/download/v1.0.0/httpstat-linux-amd64-v1.0.0 && \
	chmod +x /usr/local/bin/httpstat

RUN wget -O /usr/local/bin/hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && \
	chmod +x /usr/local/bin/hey

RUN wget -O /tmp/starship.tar.gz https://github.com/starship/starship/releases/download/v0.51.0/starship-x86_64-unknown-linux-musl.tar.gz && \
	tar xvzf /tmp/starship.tar.gz -C /usr/local/bin && \
	rm -rf /tmp/starship.tar.gz

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

RUN cd ~/.dotfiles && ./script/bootstrap.fish
