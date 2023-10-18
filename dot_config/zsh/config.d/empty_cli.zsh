# CLI and Other tools

### [Homebrew](https://github.com/homebrew) ###
# Evaluate if homebrew is working
eval "$(/opt/homebrew/bin/brew shellenv)"
# BREWPATH defines where brew and it's binaries are located
export BREWPATH="/opt/homebrew/bin"
# HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK - turns off automatic updates during installation (https://apple.stackexchange.com/a/452535)
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1


### [Taskfile](https://github.com/go-task/task) ###
# GLOBAL_TASKFILE defines the location of taskfile which can be used from anywhere
export GLOBAL_TASKFILE="$HOME/tech/github.com/alewkinr/configs/Taskfile.yml"
# gtask is a command that can be used to run a command from global taskfile
function gtask() { task -t $GLOBAL_TASKFILE $@ -- $(pwd); }


### [YandexCloud CLI](https://cloud.yandex.ru/docs/cli/quickstart) ###
# Fixing the autocompletion for zsh
if [ -f "$HOME/.yandex-cloud/completion.zsh.inc" ]; then source "$HOME/.yandex-cloud/completion.zsh.inc"; fi


### JetBrains Toolbox App
export JB_TOOLBOXPATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"


### [GIT](https://git-scm.com/doc) ###
# [scm](https://github.com/petr-korobeinikov/scm) helps to keep the git repositories structure
# SCM_WORKSPACE_DIR defines the root of workspace tree
export SCM_WORKSPACE_DIR="$HOME/tech"
# SCM_WORKSPACE_DIR_DEFAULT_PERM defines the default permissions for cloned repositories
export SCM_WORKSPACE_DIR_DEFAULT_PERM="0755"


### [AWS-CLI](https://docs.aws.amazon.com/sdkref/latest/guide/file-location.html) ###
# AWS_CONFIG_FILE defines the location of config file for aws-cli
export AWS_CONFIG_FILE="$HOME/.config/aws/config"
# AWS_SHARED_CREDENTIALS_FILE defines the location of credentials file for aws-cli
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.config/aws/credentials"

