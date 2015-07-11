Packer Tempalte for Ruby Vagrant
===

Ruby 開発環境入りの Vagrant Box をビルドするための Packer Template です。

OS には CentOS を使用し、VirtualBox 用の Vagrant Box をビルドすることがでます。

## ビルド方法

[VirtualBox](https://www.virtualbox.org/) と [packer](https://www.packer.io/) をインストールしてください。
Vagrant が 最新の VirtualBox 5.0 に対応していないため、VirtualBox 4.3.30 をインストールしてください。

Packer Tempalte for Ruby Vagrant では 64 ビットの Vagrant Box と
32 ビットの Vagrant Box をビルドすることができます。

64 ビットの Vagrant Box をビルドする場合:

    $ packer build -only=virtualbox-iso ./template.json

    ビルドに成功すると `ruby-vagrant-virtualbox-x86_64.box` ができます。

32 ビットの Vagrant Box をビルドする場合:

    $ packer build -only=virtualbox-iso -var-file=virtualbox-i386-variables.json template.json

    ビルドに成功すると `ruby-vagrant-virtualbox-i386.box` ができます。

ビルドには 20 分ぐらいかかります。

## ライセンス

[![クリエイティブ・コモンズ・ライセンス](https://i.creativecommons.org/l/by/4.0/88x31.png) クリエイティブ・コモンズ 表示 4.0 国際 ライセンスの下に提供されています。](http://creativecommons.org/licenses/by/4.0/)
