# ターミナルで動く辞書
## はじめに
辞書.appの結果をターミナルで表示させるアプリです。
ついでに、「say」コマンドで喋らせるようにしています。
詳しくは、helpコマンドを見てください。

## 推奨環境
- Mac OS X Lion
- MacRuby 0.10

## 準備
- macrubyのgemsにpaintをインストール
  $ macgem install paint

- ライフサイエンス辞書の用意
ダウンロードは修了してしまったようです。
持っていない人は、136〜145行目を削除してください。

## 動作
  $ macruby pje.rb

## 修了
  Dic > q
  Dic > quit

## 備考
DictionaryServices.bridgesupportは、(https://gist.github.com/770759)からお借りしています。
作者に感謝！
