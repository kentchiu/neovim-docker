FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y

# install command
RUN apt-get install build-essential zsh tmux wget curl tree bat git tar zip unzip gzip locales fzf net-tools -y
RUN apt-get install ripgrep fd-find python3-pip jq -y 
RUN apt-get install cargo -y 

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


# install nvim 0.9.x
RUN cd /tmp && wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb \
  && apt install ./nvim-linux64.deb

# install lazygit 
RUN cd /tmp && LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && tar xf lazygit.tar.gz lazygit \
  && install lazygit /usr/local/bin

# install git diff tool - delta
RUN  cd /tmp && wget https://github.com/dandavison/delta/releases/download/0.15.1/git-delta_0.15.1_amd64.deb \
  && apt install ./git-delta_0.15.1_amd64.deb


# Custom cache invalidation
# ARG CACHEBUST=1
# RUN echo "CACHEBUST=${CACHEBUST}"


RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git clone https://github.com/kentchiu/dotfile.git /root/.config/dotfile
RUN git clone https://github.com/kentchiu/neovim_docker.git /root/.config/neovim_docker


RUN ln -sf /root/.config/dotfile/.gitconfig /root/.gitconfig \
  && ln -sf /root/.config/dotfile/.tmux.conf /root/.tmux.conf \
  && ln -sf /root/.config/dotfile/.vimrc /root/.vimrc

# set up oh-my-zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
RUN sed -i 's/plugins=()/plugins=(git zsh-autosuggestions poetry)/' ~/.zshrc

RUN echo "PATH=/root/.local/bin:$PATH" >> ~/.zshrc


RUN git clone https://github.com/kentchiu/nvim-config.git ~/.config/kent-vim
RUN git clone https://github.com/LazyVim/starter.git      ~/.config/lazy-vim
RUN git clone https://github.com/LunarVim/LunarVim.git    ~/.config/lunar-vim
RUN git clone https://github.com/AstroNvim/AstroNvim.git  ~/.config/astro-vim
RUN git clone https://github.com/NvChad/NvChad            ~/.config/nvchad-vim

###############################################################
# Modify xxx-vim to choise which distribution you want to use #
###############################################################
# RUN ln -sf ~/.config/astro-vim ~/.config/nvim
#
# define aliases for nvim
RUN echo "alias nvim-astro='NVIM_APPNAME=astro-vim nvim'" >> ~/.zshrc && \
    echo "alias nvim-kent='NVIM_APPNAME=kent-vim nvim'" >> ~/.zshrc && \
    echo "alias nvim-lazy='NVIM_APPNAME=lazy-vim nvim'" >> ~/.zshrc && \
    echo "alias nvim-lunar='NVIM_APPNAME=lunar-vim nvim'" >> ~/.zshrc && \
    echo "alias nvim-nvchad='NVIM_APPNAME=nvchad-vim nvim'" >> ~/.zshrc  

# define function for nvim with fzf
RUN echo "function nvims() {" >> ~/.zshrc && \
    echo "  items=('default' 'astro-vim' 'kent-vim' 'lazy-vim' 'lunar-vim' 'nvchad-vim')" >> ~/.zshrc && \
    echo "  config=\$(printf \"%s\\n\" \"\${items[@]}\" | fzf --prompt=\" Neovim Config  \" --height=50% --layout=reverse --border --exit-0)" >> ~/.zshrc && \
    echo "  if [[ -z \$config ]]; then" >> ~/.zshrc && \
    echo "    echo \"Nothing selected\"" >> ~/.zshrc && \
    echo "    return 0" >> ~/.zshrc && \
    echo "  elif [[ \$config == \"default\" ]]; then" >> ~/.zshrc && \
    echo "    config=\"\"" >> ~/.zshrc && \
    echo "  fi" >> ~/.zshrc && \
    echo "  NVIM_APPNAME=\$config nvim \$@" >> ~/.zshrc && \
    echo "}" >> ~/.zshrc

# bind nvims function to Ctrl+a key
RUN echo "bindkey -s '^a' 'nvims\\n'" >> ~/.zshrc
RUN echo "alias vi='nvims'" >> ~/.zshrc

RUN chsh -s $(which zsh)

CMD ["zsh"]
