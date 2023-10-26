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
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
# AWS_SHARED_CREDENTIALS_FILE defines the location of credentials file for aws-cli
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"


### [Podman.io](https://docs.podman.io/en/latest/index.html) ###
# DOCKER_HOST defines the location of podman socket to use it as docker daemon
export DOCKER_HOST="unix://$HOME/.local/share/containers/podman/machine/qemu/podman.sock"
# PODMAN_USERNS defines the userns mode for podman. It is needed to run containers in VM with current user privileges
export PODMAN_USERNS=keep-id

### [OpenTofu](https://opentofu.org/docs/cli/config/config-file) ###
# TF_CLI_CONFIG_FILE defines the location of config file for OpenTofu CLI
export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/tofu/tofu.tfrc"