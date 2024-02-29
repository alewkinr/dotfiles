## ALIASES ##

## [Chezmoi](https://www.chezmoi.io)
alias chmz="chezmoi -c $HOME/tech/github.com/alewkinr/dotfiles/chezmoi.toml"

## Python
alias python="python3.11"
alias zshconfig="nvim ~/.zshrc"

## Kubernetes
alias k="kubectl --cache-dir=$HOME/.local/cache/kube"
alias kctx="kubectx"
alias kns="kubens"
alias ksw="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:list"
alias kswl="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:switch"

## AWS CLI
# ... some useful aliases for aws-cli will be here

## Python-tools
alias notebook="$PYTHONPATH/jupyter notebook"


