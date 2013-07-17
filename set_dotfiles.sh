#!/bin/sh

BACKUPDIR=$HOME/backup/`date -I`/

ADD_BASHRC=`grep .bashrc_mine $HOME/.bashrc`

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

mkdir -p ${HOME}/local/{bin,src,program,newsbeuter-saved-articles}
mkdir -p ${HOME}/.mutt/cache/
if [ ! -e $HOME/.muttrc ];then
    echo "[exec] cp .muttrc $HOME/.muttrc"
    cp .muttrc $HOME/.muttrc
fi

if [ "$ADD_BASHRC" = "" ];then
    echo "[info] source `pwd`/.bashrc_mine >> $HOME/.bashrc"
    echo source '$HOME/.bashrc_mine' >> $HOME/.bashrc
else
    echo "[skip] already wrote .bashrc_mine"
fi

if [ -e /etc/debian_version ]; then
    echo "[info] apt-get install"
    sudo apt-get install \
       ranger atool mediainfo transmission-cli poppler-utils highlight caca-utils w3m \
       mutt-patched mailutils \
       vim git tig openssh-server openssh-client
fi
