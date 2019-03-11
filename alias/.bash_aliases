
# tmux alias
    alias tl='tmux ls'
    alias td='tmux detach'
    alias ta='tmux attach'
    alias tk='tmux kill-server'
    alias tu='tmux'
    alias source.tmux='tmux source-file $HOME/.tmux.conf'

# bash
    alias ls='ls -a -1'
    alias q='exit'
    alias ra='ranger'
    alias ran='ranger'
    alias c='clear'
    alias source.bash='source $HOME/.bashrc'

# locations
    alias notes='cd ~/notes/'
    alias note='cd ~/notes/'
    alias code='cd ~/notes/code/'
    alias dot='cd ~/dotfiles'
    alias node="cd ~/node.setup/"

# todo.txt
    #alias t='~/Dropbox/todo.txt/todo.sh'

# dropbox
    alias dropbox.status='~/dropbox.py status'

# w3m
    alias net='w3m www.duckduckgo.com'

# git
    alias pub='sh ~/notes/code/git.sh'

# vim
    alias vim='nvim'
    alias vi='nvim'

    alias vimrc='vim ~/dotfiles/vim/.vimrc'
    alias source.vimrc='source $HOME/.vimrc'

# OS update/upgrade pkts
    alias update='sh ~/notes/code/update.sh'

# python
    alias py='python3'

# pip
    alias pip='pip3'

# newsboat
    alias news='newsboat'

# system
    alias shutdown='showdown -now'

# VirtualEnv
    #alias virtual_create='virtualenv '
    #alias virtual_source='source /bin/activate'
    #alias virtual_deactivate=''

# fail2band
    alias fail2band.start='sudo systemctl start fail2ban'
    alias fail2band.enable='sudo systemctl enable fail2ban'


# school
    alias chem='cd ~/notes/nursing/chemistry31/'

# install
    alias install.tmux.plugin.manager='git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'
    alias install.vundle='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
    alias install.notes='git clone https://gitlab.com/veggietorta/notes.git'
    alias install.dotfiles='git clone https://github.com/VeggieTorta/dotfiles.git'

# SSH
    alias ssh.status='/etc/init.d/ssh status'
    alias ssh.reload='/etc/init.d/ssh reload'
    alias ssh.stop='/etc/init.d/ssh stop'
    alias ssh.restart='/etc/init.d/ssh restart'
    alias ssh.start='/etc/init.d/ssh start'

# help
    alias help.ssh='cat $HOME/dotfiles/help/help.ssh'
    alias help.tmux='cat $HOME/dotfiles/help/help.tmux'
    alias help.git='cat $HOME/dotfiles/help/help.git'
    alias help.apt-get='cat $HOME/dotfiles/help/help.apt-get'




























