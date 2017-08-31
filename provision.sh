# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install watch

# Git
brew install git
git config --global user.name "btaba"
git config --global credential.helper osxkeychain

# scd
git clone https://github.com/pavoljuhas/smart-change-directory
sudo cp smart-change-directory/bin/scd /usr/local/bin
scd -ar ~

# Kube
brew install kubectl

# Bash Autocomplete
brew install bash-completion
brew tap homebrew/completions

# Conda
curl -O https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh
bash Anaconda3-4.4.0-MacOSX-x86_64.sh

# rclone
brew install rclone
