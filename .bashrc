# Add stuff to the PATH
# =====================

## Yarn
export PATH="${HOME}/.yarn/bin:${PATH}"
## Globally-installed Yarn packages
export PATH="${HOME}/.config/yarn/global/node_modules/.bin:${PATH}"
## Homebrew and its installed packages
export PATH="${HOME}/homebrew/bin:${PATH}"
## Extra Homebrew Postgres bits for older keg-only version
export PATH="${HOME}/homebrew/opt/postgresql@10/bin:$PATH"
## pipx
export PATH="${HOME}/.local/bin:${PATH}"
# ## Ruby
# export PATH="${HOME}/homebrew/opt/ruby@2.5/bin:${PATH}"
## aws-cli
export PATH="${HOME}/Applications/aws-cli:${PATH}"


# Initialize pyenv
# ================

## Export necessary environment variables
export PYENV_ROOT="${HOME}/.pyenv"
export WORKON_HOME="${HOME}/.virtualenvs"

## Run pyenv init command
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## Init pyenv-virtualenvwrapper
pyenv virtualenvwrapper_lazy


# Initialize rbenv
# ================

eval "$(rbenv init -)"


# Initialize nvm
# ==============

## Export necessary environment variable
export NVM_DIR="${HOME}/.nvm"

## Run nvm init script
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi


# Completions
# ===========

## pipx
eval "$(register-python-argcomplete pipx)"


# Miscellaneous
# =============

## Set open file limit to make Sauce Connect happy
## See: https://support.saucelabs.com/hc/en-us/articles/115005571668-Setting-the-Open-File-Limit-for-Use-with-Sauce-Connect-Proxy
ulimit -n 8000


# Source other dotfiles in your home directory
# ======================================================

# TODO: Determine whether I want to reintroduce .exports
for file in $HOME/.{aliases,bash_prompt,git-completion.bash}; do
  if [ -s "$file" ]; then
    source "$file"
  fi
done
unset file
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
