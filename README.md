Ruby Vagrant
===

Ruby 開発環境入りの Vagrant Box を提供します。

## 必須条件

### Windows

* お使いのパソコンが Intel VT/AMD-V に対応している必要があります。
  Intel VT/AMD-V に対応しているかどうかが不明な場合、[VirtualChecker](http://www.forest.impress.co.jp/library/software/virtualcheck/) を
  ダウンロードし実行してください。
  * Enabled と表示されれば Intel VT/AMD-V が有効になっており、Vagrant を使用することができます。
  * Disabled と表示された場合、BIOS の設定を確認し Intel VT/AMD-V を有効にすることで Vagrant を使うことが出来ます。
* ユーザ名に日本語が含まれる場合、Vagrant が起動しない場合があります。
  環境変数 `VAGRANT_HOME` を日本語を含まないディレクトリに設定し、VirtualBox の設定を変更し、default VM folder を日本語を含まないディレクトリに変更してください。
  参考: [incompatible character encodings: CP850 and Windows-1252](https://github.com/mitchellh/vagrant/issues/3937)

### Mac

* Intel ベースの Mac では、Intel VT は有効になっていますが、もし使用できない場合は https://support.apple.com/ja-jp/TS2744 を参照してください。

## VirtualBox と Vagrant のインストール方法

前項の必須条件を満たしている場合、VirtualBox と Vagrant をインストールしてください。

1. [VirtualBox Download](https://www.virtualbox.org/wiki/Downloads) ページから VirtualBox をダウンロードしてインストールします。
   Vagrant が 最新の 5.0 に対応していないため、4.3.30 をインストールしてください。
2. [Vagrant Download](http://www.vagrantup.com/downloads.html) ページから Vagrant をダウンロードしてインストールします。
3. (Windows の人のみ) [Git for Windows](https://msysgit.github.io/) ページから Git をダウンロードしてインストールします。
   これは `vagrant up` 時に ssh コマンドが必要になるためで、Git に付属している ssh を用いるのが一番手っ取り早いのでインストールします。
4. (Windows の人のみ) [Tera Term](http://sourceforge.jp/projects/ttssh2/releases/) などのお好きな SSH クライアントをインストール。

※ Mac には最初から十分な機能を持つ SSH とターミナルがインストールされているので、Git と Tera Term のインストールは不要です。

## 使用方法

適当なディレクトリを作成し、次のような内容を持つ `Vagrantfile` を作成してください。

    $ mkdir ruby-dev
    $ cd ruby-dev
    $ cat Vagrantfile

64 ビットの Vagrant Box を使用する場合:

    VAGRANTFILE_API_VERSION = "2"
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = "ruby-vagrant"
      config.vm.box_url = "https://github.com/tokushimarb/ruby-vagrant/releases/download/20150711/ruby-vagrant-virtualbox-x86_64.box"
      config.vm.network :forwarded_port, guest: 3000, host: 3000

      config.vm.provider :virtualbox do |vb|
        # see: http://blog.shibayu36.org/entry/2013/08/12/090545
        # IPv6 と DNS でのネットワーク遅延対策で追記
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      end
    end

32 ビットの Vagrant Box を使用する場合:

    VAGRANTFILE_API_VERSION = "2"
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = "ruby-vagrant"
      config.vm.box_url = "https://github.com/tokushimarb/ruby-vagrant/releases/download/20150711/ruby-vagrant-virtualbox-i386.box"
      config.vm.network :forwarded_port, guest: 3000, host: 3000

      config.vm.provider :virtualbox do |vb|
        # see: http://blog.shibayu36.org/entry/2013/08/12/090545
        # IPv6 と DNS でのネットワーク遅延対策で追記
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      end
    end

次のコマンドで起動できます。

    $ vagrant up

Windows の方は、別途 Git をインストールし git-bash から上記コマンドを実行してください。

`vagrant up` には 5 分から 10 分ぐらいかかるので、コーヒーでも飲みながら待ってください。
もし、`vagrant up` が失敗する場合、次の点を確認して下さい。
  * Intel VT/AMD-V が有効になっている。
  * ユーザ名はアルファベット、数字、ハイフン、アンダーバーのみを含む。

起動したら次のコマンドでログインしてください。

    $ vagrant ssh

Windows の方は Tera Term などの SSH クライアントで、
次の接続情報を使用してログインしたほうが快適に使えると思います。

* host: localhost
* port: 2222
* user: vagrant
* password: vagrant

## Vagrant Box の中身

64 ビット:
* CentOS 7.1.1503 (Latest at 2015-07-10)
* RVM 1.26.11
* Ruby 2.2.2p95

32 ビット:
* CentOS 6.6 (Latest at 2015-07-10)
* RVM 1.26.11
* Ruby 2.2.2p95

## ライセンス

本書および `Vagrantfile` は、
[![クリエイティブ・コモンズ・ライセンス](https://i.creativecommons.org/l/by/4.0/88x31.png) クリエイティブ・コモンズ 表示 4.0 国際 ライセンスの下に提供されています。](http://creativecommons.org/licenses/by/4.0/)

それ以外のものについては、それぞれのライセンスにしたがいます。
