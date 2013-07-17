#!/bin/sh

BACKUPDIR=$HOME/backup/`date -I`/

for file in .*
do
    case $file in
    "."|".."|".git"|".gitignore"|".set_dotfiles.sh.swp")
        continue
        ;;
    esac

    if [ -e $HOME/$file ]; then
      if [ -L $HOME/$file ]; then
        echo "[skip] already $file exists."
        continue
      fi
      if [ ! -e $BACKUPDIR ]; then
        mkdir -p "$BACKUPDIR"
      fi
      echo "[info] $file exists."
      echo "[info] mv $HOME/$file $BACKUPDIR"
      mv $HOME/$file "$BACKUPDIR"
    fi

    echo "[info] ln -s `pwd`/$file $HOME/$file"
    ln -s `pwd`/$file $HOME/$file
done
