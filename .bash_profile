# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Anaconda
export PATH="$HOME/anaconda3/bin:$PATH"

# scd
source $HOME/smart-change-directory/shellrcfiles/bashrc_scd

# Load the shell dotfiles, and then some:
for file in ~/.{sh_prompt,exports,aliases,functions,extras}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Bash history
shopt -s histappend                      # append to history, don't overwrite it

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
    source <(kubectl completion bash)
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Fix git config based on Platform
if [[ $(uname -s) = 'Linux' ]]; then
	helper='cache'
else
	helper='osxkeychain'
fi
git config --global credential.helper $helper

