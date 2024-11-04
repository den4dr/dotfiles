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

#Setting AWS Default Profile
export AWS_DEFAULT_PROFILE=prd-sandbox
export AWS_SDK_LOAD_CONFIG=1

#Setting usr binary
export PATH=$PATH:$HOME/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/den4dr/.sdkman"
[[ -s "/home/den4dr/.sdkman/bin/sdkman-init.sh" ]] && source "/home/den4dr/.sdkman/bin/sdkman-init.sh"

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

