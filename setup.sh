#!/bin/sh

BACKUPDIR=$HOME/backup/

#-------------------------------------------------------------------------------
for file in .*
do
    case $file in
    "."|".."|".git"|".gitignore"|".set_dotfiles.sh.swp"|".muttrc")
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
      echo "[exec] mv $HOME/$file $BACKUPDIR"
      mv $HOME/$file "$BACKUPDIR"
    fi

    echo "[exec] ln -s `pwd`/$file $HOME/$file"
    ln -s `pwd`/$file $HOME/$file
    echo
done

## .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
