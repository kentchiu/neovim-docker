FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install command
RUN apt-get install build-essential tmux wget curl tree bat git ripgrep fd-find fzf python3-pip unzip tar zip unzip gzip -y 


WORKDIR /root

# nodejs 
RUN  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&  \
  apt-get install -y nodejs

RUN npm install -g tree-sitter-cli neovim

# python

RUN python3 -m pip install --upgrade pynvim

RUN curl -sSL https://install.python-poetry.org | python3 -


# install nvim 0.8.3
RUN cd /tmp && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && \
  apt install ./nvim-linux64.deb


# Custom cache invalidation
ARG CACHEBUST=1

RUN echo "CACHEBUST=${CACHEBUST}"

# based on kickstart.nvim
COPY . /root/.config/neovim_docker

RUN ln -sf /root/.config/neovim_docker/nvim /root/.config/nvim

CMD ["nvim"]
