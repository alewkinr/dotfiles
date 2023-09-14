### CLI and Other tools

## [Homebrew](https://github.com/homebrew)
# BREWPATH defines where brew and it's binaries are located
export BREWPATH="/opt/homebrew/bin"

# HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK - turns off automatic updates during installation (https://apple.stackexchange.com/a/452535)
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

## [Taskfile](https://github.com/go-task/task) 
# GLOBAL_TASKFILE defines the location of taskfile which can be used from anywhere
export GLOBAL_TASKFILE="$HOME/tech/github.com/alewkinr/configs/Taskfile.yml"
# gtask is a command that can be used to run a command from global taskfile
function gtask() { task -t $GLOBAL_TASKFILE $@ -- $(pwd); }


## [YandexCloud CLI](https://cloud.yandex.ru/docs/cli/quickstart)
# Fixing the autocompletion for zsh
if [ -f "$HOME/.yandex-cloud/completion.zsh.inc" ]; then source "$HOME/.yandex-cloud/completion.zsh.inc"; fi
