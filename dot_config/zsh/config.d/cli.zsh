# CLI and Other tools

### [Homebrew](https://github.com/homebrew) ###
# Evaluate if homebrew is working
eval "$(/opt/homebrew/bin/brew shellenv)"
# BREWPATH defines where brew and it's binaries are located
export BREWPATH="/opt/homebrew/bin"
# HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK - turns off automatic updates during installation (https://apple.stackexchange.com/a/452535)
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
# HOMEBREW_BUNDLE_FILE_GLOBAL defines the location of Brewfile which can be used from anywhere
export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/tech/github.com/alewkinr/dotfiles/Brewfile"


### [Taskfile](https://github.com/go-task/task) ###
# GLOBAL_TASKFILE defines the location of taskfile which can be used from anywhere
export GLOBAL_TASKFILE="$HOME/tech/github.com/alewkinr/configs/Taskfile.yml"
# gtask is a command that can be used to run a command from global taskfile
function gtask() { task -t $GLOBAL_TASKFILE $@ -- $(pwd); }


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


### [OpenTofu](https://opentofu.org/docs/cli/config/config-file) ###
# TF_CLI_CONFIG_FILE defines the location of config file for OpenTofu CLI
export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/tofu/tofu.tfrc"


### [libpq](https://formulae.brew.sh/formula/libpq#default) ###
# LIBPQPATH defines the location of libpq binaries
export LIBPQPATH="/opt/homebrew/opt/libpq/bin"


## [Docker](https://docs.docker.com/reference/cli/dockerd/) ###
# DOCKERPATH defines path to docker binaries
export DOCKERPATH="$HOME/.docker/bin"
# DOCKER_CLI_HINTS defines the setting to turn on the cli-completion
export DOCKER_CLI_HINTS=true

