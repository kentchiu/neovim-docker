FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install useful command 
RUN apt-get install build-essential tmux wget curl tree bat git ripgrep fd-find fzf -y


# nodejs 
RUN  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&  \
  apt-get install -y nodejs

RUN npm install -g tree-sitter-cli neovim

WORKDIR /root

RUN mkdir download

# install nvim 0.8.3
RUN cd download && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && \
  apt install ./nvim-linux64.deb

# based on kickstart.nvim
COPY nvim /root/.config/nvim


CMD ["bash.sh"]
