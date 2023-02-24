FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install useful command 
RUN apt-get install wget curl tree bat git ripgrep -y


WORKDIR /root

RUN mkdir download

# install nvim 0.8.3
RUN cd download && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && apt install ./nvim-linux64.deb

# install packer
# RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim && ~/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY nvim /root/.config/nvim

CMD ["bash.sh"]
