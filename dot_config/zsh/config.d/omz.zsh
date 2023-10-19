### OH-MY-ZSH.SH ###

# ZSH defines the path to your [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) installation
export ZSH="$(chmz source-path)/external_include/ohmyzsh"

# Source plugins installed with brew. Copy to omz directory is not required.
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" # https://github.com/zsh-users/zsh-autosuggestions
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # https://github.com/zsh-users/zsh-syntax-highlighting

# plugins defines the list of plugins which will be loaded in your zsh. Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	# task # temporarily turned off
	kubectl
	docker
	poetry
)

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE defines opacity of zsh-autosuggestions plugin
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# ZSH_DISABLE_COMPFIX disables compfix check
ZSH_DISABLE_COMPFIX="true"

# Adding the zsh-autocompletion for tools installed via brew
if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh-completions":$FPATH
fi

# Adding zsh-autocompletion for CLI tools installed in a custom way
if [ -d "$HOME/.config/zsh/completions" ]; then
  FPATH="$HOME/.config/zsh/completions":$FPATH
fi

# Autoload the zsh-autocompletion
autoload -U compinit; compinit


source $ZSH/oh-my-zsh.sh

# This `source` below defines the [theme](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) for your oh-my-zsh
source "$HOME/.config/zsh/themes/lambda-gitster.zsh-theme"
