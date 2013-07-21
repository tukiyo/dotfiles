dotfiles
--------

$ sh set_dotfiles.sh
http://www.webupd8.org/search/label/cli
の全記事目を通して、自分に合いそうな内容のまとめ。

## liquidprompt

* bashのPS1をゴージャスにする。また、gitの状態やバッテリー残量、現在時刻の表示も。

## apt-fast

* ppaから入れる。分割ダウンロード支援ソフト(aria2)を使うので早いらしい。

## 各種topコマンド

* powertop, iftop, iotop

## vimpager

* www.vim.orgからダウンロードできます。spaceでページ送り、qで終了できます。

## ファイルのコピー、貼り付け

* ファイルをccopyで/tmp/にコピーしたあと、目的の場所に移動してcpasteで貼り付けができます。

```Bash:
ccopy(){ while (( $# )); do cp -av "${1}" "/tmp/ccopy.${1}"; shift; done; }
alias cpaste="ls -d /tmp/ccopy* | sed 's|[^\.]*.\.||' | xargs -I % mv -v /tmp/ccopy.% ./%"
```

## CLI Companion

* コマンドの使い方例と、Commandline-fuのコマンドをそのまま実行できる。
* [動画](http://www.youtube.com/watch?v=nP5UbygAAu0)

## Ultimate .bashrc

* 550kbという巨大な.bashrc。これをそのまま使うのではなく、勉強用によいかと。

## pvコマンド

* ファイルの移動で進捗状況が表示される。mvのaliasとして使うには適さない。

## fishシェル

* コマンドの説明が充実している。とても感動しました。
* ubuntuのパッケージは古い(1.3)ので、公式サイトの2.0を入れましょう。

## .inputrc

* /etc/inputrcで足りないところをここで設定する。
* .bashrcにbindコマンドで割り当てする方法もあり。

## .bashrc

* ほか多数。

```Bash:
## autocd
shopt -s autocd

## man command <Esc-h> or <Alt-h>
bind '"\eh": "\C-a\eb\ed\C-y\e#man \C-y\C-m\C-p\C-p\C-a\C-d\C-e"'
# ctrl+left/right arrows:
bind '"\e\x5b\x31\x3b\x35\x44"':backward-word
bind '"\e\x5b\x31\x3b\x35\x43"':forward-word
# alt+b/f:
bind '"\xe2"':'"\M-b"'
bind '"\xe6"':'"\M-f"'
# alt+'.':
bind '"\xae"':yank-last-arg

## history pgup,pgdn
bind '"\e[5~": history-search-backward'
bind '"\e[6~": history-search-forward'
HISTTIMEFORMAT="[%y-%m-%d %T] "
HISTIGNORE="&:ls:[bf]g:exit"
HISTCONTROL="erasedups:ignoreboth"

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias du="gt5"
```
