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
    for i in local/deb/*.deb;
    do
        sudo dpkg -i 
    done
    if [ ! "`dpkg -l | grep y-ppa-manager`" ];then
        echo "[info] apt-get install"
        sudo apt-get -q install \
           ranger atool mediainfo highlight caca-utils w3m \
           vim git tig nkf manpages-ja manpages-ja-dev acpi \
           pv unp trash-cli gt5 \
           iotop iftop powertop
           # transmission-cli poppler-utils 
           # mutt-patched mailutils \
           # openssh-server openssh-client
        #sudo update-alternatives --all

        ## y-ppa-manager
        #sudo apt-get install -q -y software-properties-common
        #sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager && sudo apt-get -qq update
        #sudo apt-get install -q -y y-ppa-manager

        #apt-get install \
        # ffmpeg build-essential screen byobu tmux ibus-mozc uim-fep uim-mozc \
        # filezilla zsh git tig ranger mysql-client mysql-server \
        # php5-cgi php5-cli php5-common php5-curl php5-dbg php5-dev php5-gd php5-gmp php5-ldap php5-mysql php5-odbc php5-pgsql php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-adodb php5-enchant php5-exactimage php5-ffmpeg php5-gdcm php5-geoip php5-imagick php5-imap php5-interbase php5-intl php5-lasso php5-librdf php5-mapscript php5-mcrypt php5-memcache php5-memcached php5-midgard2 php5-ming php5-mongo php5-ps php5-radius php5-remctl php5-rrd php5-sasl php5-svn php5-sybase php5-tokyo-tyrant php5-vtkgdcm php5-xcache php5-xdebug \
        # zip unzip unrar rar ntpdate mailutils python-all python3-all ack-grep \
        # rdesktop vino tightvncserver xtightvncviewer \
        # manpages-ja manpages-ja-dev \
        # python-repoze.sphinx.autointerface python-sphinx-issuetracker python-sphinxbase python-sphinxcontrib.actdiag python-sphinxcontrib.blockdiag python-sphinxcontrib.issuetracker python-sphinxcontrib.nwdiag python-sphinxcontrib.seqdiag python-sphinxcontrib.spelling sphinx3 sphinx3-doc sphinxbase-utils sphinxsearch sphinxtrain \
        # exuberant-ctags \
        # virtualbox virtualbox-guest-additions-iso virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 vagrant \
        # lxc lxc-templates lxctl python3-lxc \
        # nkf

    fi
    sudo apt-get clean
fi
