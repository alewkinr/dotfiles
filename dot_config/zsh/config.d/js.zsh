### JavaScript / TypeScript ###

# NPM_GLOBAL_PATH defines path variable for global [npm](https://docs.npmjs.com)
# For npm global path should be added in PATH since it is installed via homebrew
# If not, try `cd "$(npm -g prefix)/bin"`

# NPM_CONFIG_USERCONFIG defines path to userconfig for npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/userconfig"

# YARNGLOBALPATH defines path variable to gloabal [Yarn](https://github.com/yarnpkg/berry)
export YARNGLOBALPATH="$XDG_CONFIG_HOME/yarn/global"
