#!/bin/sh

BACKUPDIR=$HOME/backup/`date -I`/
ADD_BASHRC=`grep .bashrc_mine $HOME/.bashrc`

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

#-------------------------------------------------------------------------------
for name in bin src program newsbeuter-saved-articles; do mkdir -p ${HOME}/local/${name}; done

#-------------------------------------------------------------------------------
mkdir -p ${HOME}/.mutt/cache/
if [ ! -e $HOME/.muttrc ];then
    echo "[exec] cp .muttrc $HOME/.muttrc"
    cp .muttrc $HOME/.muttrc
fi

#-------------------------------------------------------------------------------
if [ "$ADD_BASHRC" = "" ];then
    echo "[info] source `pwd`/.bashrc_mine >> $HOME/.bashrc"
    echo source '$HOME/.bashrc_mine' >> $HOME/.bashrc
else
    echo "[skip] already wrote .bashrc_mine"
fi

#-------------------------------------------------------------------------------
if [ -e /etc/debian_version ]; then
    if [ ! "`dpkg -l | grep apt-fast`" ];then
        sudo apt-get install aria2 libc-ares2 pyton-vte
        sudo dpkg -i local/program/*.deb
    fi
    if [ ! "`dpkg -l | grep y-ppa-manager`" ];then
        echo "[info] apt-get install"
        sudo apt-fast -q install \
           ranger atool mediainfo highlight caca-utils w3m \
           vim git tig nkf manpages-ja manpages-ja-dev acpi \
           pv
           # transmission-cli poppler-utils 
           # mutt-patched mailutils \
           # openssh-server openssh-client
        #sudo update-alternatives --all

        ## y-ppa-manager
        #sudo apt-get install -q -y software-properties-common
        #sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager && sudo apt-get -qq update
        #sudo apt-get install -q -y y-ppa-manager
    fi
    sudo apt-get clean
fi
