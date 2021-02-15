#!/bin/bash
# Author: @veggietorta
# Update: 02.14.21


menu_ask_user()
{
    # Log function
    # Promp & read input
    # Load source based on input using If/then statement

    echo $el_day_time ": Enter menu_ask_user" >> $el_log
    clear

    echo "Select program to setup or modify:\n"
    echo "1. zsh and Oh-my-zsh"
    echo "2. neovim\n"
    echo "q. exit"

    read main_menu_input

    # Source ZSH file
    if [ $main_menu_input = '1' ]
    then
        echo $el_day_time ": Option 1, Zsh file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/zsh
        menu_zsh


    # Source Neovim file
    elif [ $main_menu_input = '2' ]
    then
        echo $el_day_time ": Option 2, Neovim file selected" >> $el_log
        . $HOME/dotfiles/setupfiles/neovim
        menu_neovim

    # Exit
    elif [ $main_menu_input = 'q' ]
    then
        exit 1


    else
        echo $el_day_time ": Input not understood sent back to menu_ask_user" >> $el_log
        menu_ask_user
    fi

}

. $HOME/dotfiles/setupfiles/logging_script
log_it_up
