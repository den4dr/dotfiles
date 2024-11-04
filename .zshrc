# Set Locale
case $TERM in
    linux)
        LANG=en_US.UTF-8 ;;
    *)
        LANG=ja_JP.UTF-8 ;;
esac

# Docker Settings
# bash $(pack completion)

# shortcut alias
alias iiu="intellij-idea-ultimate"
alias chrome="google-chrome > /dev/null 2>&1"
alias la="ls -la"

#Setting AWS Default Profile
export AWS_DEFAULT_PROFILE=prd-sandbox
export AWS_SDK_LOAD_CONFIG=1

#Setting usr binary
export PATH=$PATH:$HOME/bin

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# asdf set up
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/plugins/golang/set-env.zsh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Zinit config by den4dr
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet PZTM::helper
### End of Zinit Config

### starship Config
 eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/den4dr/.sdkman"
[[ -s "/home/den4dr/.sdkman/bin/sdkman-init.sh" ]] && source "/home/den4dr/.sdkman/bin/sdkman-init.sh"
