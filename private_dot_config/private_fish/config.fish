#!/usr/bin/env fish
#
#
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

fish_add_path "$HOME/Library/Python/3.9/bin"
fish_add_path "$HOME/.krew/bin"

set -Ux EDITOR vim
set -Ux VISUAL $EDITOR

#set -Ux DOTFILES ~/.dotfiles
set -Ux PROJECTS ~/Projects

#set -Ua fish_user_paths $DOTFILES/bin $HOME/.bin

#for f in $DOTFILES/*/functions
#  set -Up fish_function_path $f
#end

#if test -f ~/.localrc.fish
#  ln -sf ~/.localrc.fish ~/.config/fish/conf.d/localrc.fish
#end



test -r "$HOME/.dir_colors" && eval (gdircolors -c $HOME/.dir_colors)

alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

abbr -a kx kubectx
abbr -a kn kubens

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish ; or true

set -gx HOMEBREW_NO_ANALYTICS 1
