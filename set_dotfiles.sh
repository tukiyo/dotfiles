#!/bin/sh

BACKUPDIR=$HOME/backup/`date -I`/

ADD_BASHRC=`grep .bashrc_mine $HOME/.bashrc`

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

mkdir -p ${HOME}/local/{bin,src,program,newsbeuter-saved-articles}

if [ "$ADD_BASHRC" = "" ];then
    echo "[info] source `pwd`/.bashrc_mine >> $HOME/.bashrc"
    echo source '$HOME/.bashrc_mine' >> $HOME/.bashrc
else
    echo "[info] already wrote .bashrc_mine"
fi
