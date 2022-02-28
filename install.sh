#!/usr/bin/env zsh

################################################################################
# utilities
################################################################################
dotfiles_dir=${0:a:h}
path_in_dotfiles() {
    echo "${dotfiles_dir}/$1"
}

cmd_present() {
    if (( $+commands[$1] )); then
        return 0
    else
        return 1
    fi
}

env_codespace() {
    if [[ $CODESPACES == "true" ]]; then
        return 0
    else
        return 1
    fi
}

link_dotfile() {
    dotfile=$1
    destination=$2

    ln -sf $(path_in_dotfiles $dotfile) $destination
}

################################################################################
# dotfiles
################################################################################

link_dotfile "git/gitconfig.config" "$HOME/.gitconfig"
