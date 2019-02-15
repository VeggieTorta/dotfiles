#!/bin/bash


# vim
vim_link()
    {
        # check for existance of vimrc in $HOME directory
    if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]

    then
        # vimrc found, remove found vimrc and create symbolic link from vimrc in dotfiles
        unlink ~/.vimrc # should a symbolic link already exist
        rm ~/.vimrc &> /dev/null # &> /dev/null suppress error message.
		echo a vimrc was found, removed and replaced

    else
        # vimrc not found, created symbolic link
        ln -s ~/dotfiles/vim/.vimrc ~/
		echo vimrc not found, created symbolic link
    fi
    neovim_link
    }

#neovim
neovim_link()
    {
    if [ -e ~/.config/nvim/init.vim]
    then
         rm ~/.config/nvim/init.vim
         ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/
         echo neovim init.vim file found and replaced with init.vim from dotfiles directory.
     else
         ln -s ~/dotfiles/neovim/init.vim ~/.config/nvim/
         echo neovim init.vim not found, init.vim file from dotfiles directory established.
     fi
     ask_user
    }

# bash
bashrc_link()
    {
    if [ -e ~/.bashrc ]
    then
        rm ~/.bashrc
	    ln -s ~/dotfiles/bash/.bashrc ~/
    else
        ln -s ~/dotfiles/bash/.bashrc ~/
    fi
    ask_user
    }

# bash_aliases
bash_aliases_link()
    {
    if [ -e ~/.bash_aliases ]
    then
        rm ~/.bash_aliases
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    else
        ln -s ~/dotfiles/bash/.bash_aliases ~/
    fi
    ask_user
    }

# tmux
tmux_link()
    {
    if [ -e ~/.tmux.conf ]
    then
        rm ~/.tmux.config
        ln -s ~/dotfiles/tmux/.tmux.conf ~/
    else
        ln -s ~/dotfiles/tmux/.tmux.conf ~/
    fi
    ask_user
    }

# neomutt
neomuttrc_link()
    {
    if [ -e ~/.neomuttrc ]
    then
        rm ~/.neomuttrc
        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
    else
        ln -s ~/dotfiles/neomutt/.neomuttrc ~/
    fi
    ask_user
    }

newsboat_config_link()
    {
    if [ -e ~/.config/newsboat/config ]
    then
        rm ~/.config/newsboat/config
        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
        echo newsboat config was found, removed and a link from the dotfiles directory established.
    else
        ln -s ~/dotfiles/newsboat/config ~/.config/newsboat/
        echo newsboat config was not found, a link from the dotfiles directory was established.
    fi
    newsboat_urls_link
    }

newsboat_urls_link()
    {
    if [ -e ~/.config/newsboat/urls ]
    then
        rm ~/.config/newsboat/urls
        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
        echo newsboat urls was found, removed and a link from dotfiles directory established.
    else
        ln -s ~/dotfiles/newsboat/urls ~/.config/newsboat/
        echo newsboat urls not was not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }


ranger_link()
    {
    if [ -e ~/.config/ranger/rc.conf ]
    then
        rm -rf ~/.config/ranger/rc.conf
        rm -rf ~/.config/ranger/rifle.conf
        rm -rf ~/.config/ranger/bookmarks
        rm -rf ~/.config/ranger/tagged

        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/

        echo ranger config files were found, removed and a link from dotfiles directory established.

    else
        ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger/
        ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/
        ln -s ~/dotfiles/ranger/tagged ~/.config/ranger/

        echo ranger config fiels were not found, a link from the dotfiles directory was established.
    fi
    ask_user
    }

###############################

ask_user()
    {
    echo -n 'Select the symbolic link you want setup

         1. "vim / neovim"
         2. "bash"
         3. "bash aliases"
         4. "tmux"
         5. "neomutt"
         6. "newsboat"
         7. "ranger"
         9. "All"
         0. "exit")
                '

    read ans

    case "$ans" in
        1)
            vim_link
            # vim_link is linked to neovim_link
            ;;
        2)
            bash_link
            ;;
        3)
            bash_aliases_link
            ;;
        4)
            tmux_link
            ;;
        5)
            neomuttrc_link
            ;;
        6)
            newsboat_config_link
            ;;
        7)
            ranger_link
            ;;
        9)
            vim_link && bashrc_link && bash_aliases_link && tmux_link && neomuttrc_link && newsboat_config_link && ranger_link
            ;;
        0)
            exit
            ;;
    esac
    }

########################################################

ask_user

