## ALIASES ##

## [Chezmoi](https://www.chezmoi.io)
alias chmz="chezmoi -c ~/tech/github.com/alewkinr/dotfiles/chezmoi.toml"

## Python
alias python="python3.11"
alias zshconfig="nvim ~/.zshrc"

## Kubernetes
alias k="kubectl --cache-dir=$HOME/.local/cache/kube"
alias kctx="kubectx"
alias kns="kubens"
alias ksw="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:list"
alias kswl="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:switch"


## [Podman](https://podman.io)
alias p="podman"
alias pms="podman machine start host.internal"
alias pmt="podman machine stop host.internal"
alias pc="podman-compose"

## AWS CLI
# ... some useful aliases for aws-cli will be here

## Python-tools
alias notebook="$PYTHONPATH/jupyter notebook"


