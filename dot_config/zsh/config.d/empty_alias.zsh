## ALIASES ##

## [Chezmoi](https://www.chezmoi.io)
alias chmz="chezmoi -c ~/tech/github.com/alewkinr/dotfiles/chezmoi.toml"

## Python
alias python="python3.11"
alias zshconfig="nvim ~/.zshrc"

## Kubernetes
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias ksw="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:list"
alias kswl="task -t '$HOME/tech/github.com/alewkinr/configs/Taskfile.yml' kube:sw:switch"


## AWS CLI
# alias aws="python3 $PYTHONPATH/aws" # fixed for brew binary
alias awsmts="aws --profile oa-s3 --endpoint-url=https://s3mts.ru:443"
alias awsgeomts="aws --profile geo-s3 --endpoint-url=https://geo.s3mts.ru:443"

## Python-tools
alias notebook="$PYTHONPATH/jupyter notebook"


