#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
                --exclude "*.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bashrc;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# brew
read -p "Install brew? (y/n)" -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# scd
read -p "Install scd? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	cd ~
	rm -rf smart-change-directory
	git clone https://github.com/pavoljuhas/smart-change-directory
	sudo cp smart-change-directory/bin/scd /usr/local/bin
	cd -
	scd -ar ~
	source ~/.bash_profile
fi;

# Conda
read -p "Install conda? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	curl -O https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh
	bash Anaconda3-4.4.0-MacOSX-x86_64.sh
	rm Anaconda3-4.4.0-MacOSX-x86_64.sh
fi;

