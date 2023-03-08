FROM ubuntu:22.04


RUN apt-get update && apt-get upgrade -y

# install command
RUN apt-get install build-essential zsh tmux wget curl tree bat git \
  ripgrep fd-find fzf python3-pip unzip tar zip unzip gzip locales -y 

RUN locale-gen en_US.UTF-8

WORKDIR /root

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# nodejs 
RUN  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&  \
  apt-get install -y nodejs

RUN npm install -g tree-sitter-cli neovim



# python

RUN python3 -m pip install --upgrade pynvim

RUN curl -sSL https://install.python-poetry.org | python3 -

# config poetry to use in project venv 
RUN /root/.local/bin/poetry config virtualenvs.in-project true

# install nvim 0.8.3
RUN cd /tmp && wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb && \
  apt install ./nvim-linux64.deb

# install lazygit 
RUN cd /tmp && LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && tar xf lazygit.tar.gz lazygit \
  && install lazygit /usr/local/bin

# install git diff tool - delta
RUN  cd /tmp && wget https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb \
  && apt install ./git-delta_0.15.1_amd64.deb

# RUN cd /tmp && mkdir fonts && cd fonts && \ 
#   wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip && \ 
#   unzip JetBrainsMono.zip

# fix utf-8 and color issue
#RUN echo "alias tmux='tmux -u2'" >> ~/.bashrc
#RUN echo "alias vi='nvim'" >> ~/.bashrc
#RUN echo "export PATH=/root/.local/bin:$PATH" >> ~/.bashrc


# Custom cache invalidation
# ARG CACHEBUST=1
# RUN echo "CACHEBUST=${CACHEBUST}"


RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git clone https://github.com/kentchiu/dotfile.git /root/.config/dotfile
RUN git clone https://github.com/kentchiu/neovim_docker.git /root/.config/neovim_docker


RUN ln -sf /root/.config/neovim_docker/nvim /root/.config/nvim \
  && ln -sf /root/.config/dotfile/.gitconfig /root/.gitconfig \
  && ln -sf /root/.config/dotfile/.tmux.conf /root/.tmux.conf \
  && ln -sf /root/.config/dotfile/.vimrc /root/.vimrc
# && ln -sf /root/.config/dotfile/.zshrc /root/.zshrc 

# set up oh-my-zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
RUN sed -i 's/plugins=()/plugins=(git zsh-autosuggestions poetry)/' ~/.zshrc

RUN echo "alias vi='nvim'" >> ~/.zshrc
RUN echo "PATH=/root/.local/bin:$PATH" >> ~/.zshrc

# change default shell to zsh
RUN chsh -s $(which zsh)

CMD ["zsh"]
