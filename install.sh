#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc zshrc Xresources xinit"

echo -n "Creating $olddir for backup of any existing dotfiles in ~..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old
	echo "Creating symlink to $file in hoe directory"
	ln -s $dir/$file ~/.$file
done
