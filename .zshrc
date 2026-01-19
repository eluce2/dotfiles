# 1Password SSH agent (macOS only - containers use forwarded agent)
if [[ "$OSTYPE" == "darwin"* ]]; then
    export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

# Znap plugin manager
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh

# Plugins
znap source marlonrichert/zsh-autocomplete
znap source grigorii-zander/zsh-npm-scripts-autocomplete
znap source zsh-users/zsh-syntax-highlighting
znap source "MichaelAquilina/zsh-you-should-use"
znap source mafredri/zsh-async
znap source "sindresorhus/pure"
znap source Aloxaf/fzf-tab

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt inc_append_history


# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus
# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
# Other
setopt prompt_subst

alias clauded="claude --dangerously-skip-permissions"
alias ls="ls --color"


# Prompt (robbyrussell-style)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{blue}git:(%F{red}%b%F{blue})%f'
zstyle ':vcs_info:git:*' actionformats ' %F{blue}git:(%F{red}%b|%a%F{blue})%f'

git_dirty() {
  [[ -n $(git status --porcelain 2>/dev/null) ]] && echo " %F{yellow}✗%f"
}

PROMPT='%F{green}➜%f %F{cyan}%c%f${vcs_info_msg_0_}$(git_dirty) '


