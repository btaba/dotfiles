##### dotfiles

`.extras` is for adding specific things to the bash profile such as:

```
GIT_AUTHOR_NAME="btaba"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="btaba@tabanpour.info"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

To bootstrap on new computer:

```

git clone https://github.com/btaba/dotfiles.git && cd dotfiles && source bootstrap.sh
source brew.sh

```

References:

* https://github.com/mathiasbynens/dotfiles
