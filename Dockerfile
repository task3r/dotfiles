FROM ubuntu:22.04

RUN apt-get update -qq \
	&& apt-get install -y -qq --no-install-recommends \
	software-properties-common gpg-agent curl \
	git build-essential unzip fzf golang python3-pip python3-venv \
	ripgrep fd-find exuberant-ctags jq wget cargo tmux

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - \
	&& apt-get install -y -qq --no-install-recommends nodejs
RUN curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq '.assets[] | select(.name|match("deb$")) | .browser_download_url' | xargs wget \
	&& apt install ./nvim-linux64.deb && rm nvim-linux64.deb

COPY ./init.lua /root/.config/nvim/init.lua
COPY ./tmux.conf /root/.tmux.conf

WORKDIR /root
