FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install command
RUN apt-get install build-essential tmux wget curl tree bat git \
  ripgrep fd-find fzf python3-pip unzip tar zip unzip gzip locales -y 

RUN locale-gen en_US.UTF-8

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

# RUN cd /tmp && mkdir fonts && cd fonts && \ 
#   wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip && \ 
#   unzip JetBrainsMono.zip

# fix utf-8 and color issue
RUN echo "alias tmux='tmux -u2'" >> ~/.bashrc
RUN echo "alias vi='nvim'" >> ~/.bashrc
RUN echo "export PATH=/root/.local/bin:$PATH" >> ~/.bashrc

# config poetry to use in project venv 
RUN poetry config virtualenvs.in-project true

# Custom cache invalidation
ARG CACHEBUST=1
RUN echo "CACHEBUST=${CACHEBUST}"


RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git clone https://github.com/kentchiu/dotfile.git /root/.config/dotfile
RUN git clone https://github.com/kentchiu/neovim_docker.git /root/.config/neovim_docker

RUN ln -sf /root/.config/neovim_docker/nvim /root/.config/nvim
RUN ln -sf /root/.config/dotfile/.tmux.conf /root/.tmux.conf
# RUN source /root/.tmux.conf


CMD ["nvim"]
