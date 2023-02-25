FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install command
RUN apt-get install build-essential tmux wget curl tree bat git ripgrep fd-find fzf python3-pip -y 


WORKDIR /root

# nodejs 
RUN  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&  \
  apt-get install -y nodejs

RUN npm install -g tree-sitter-cli neovim

# python

RUN python3 -m pip install --upgrade pynvim

RUN curl -sSL https://install.python-poetry.org | python3 -


RUN mkdir download

# install nvim 0.8.3
RUN cd download && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && \
  apt install ./nvim-linux64.deb

# based on kickstart.nvim
COPY nvim /root/.config/nvim


CMD ["nvim"]
