# コマンドチートシート

**SSH**

```bash
ssh-keygen -t rsa -b 4096
```


**Git: 初期設定**

```bash
git config --global user.email 31821663+9sako6@users.noreply.github.com
git config --global user.name 9sako6

git remote add origin git@....
git push -u origin master
```

**Git: 自分のいるブランチが他の人によってforce-pushされたとき，カレントブランチを削除せずに変更を取り込む**

```bash
git fetch
git reset --hard origin/topic
```

- [自分のいるブランチが他の人によってforce-pushされたとき，カレントブランチを削除せずに変更を取り込む - Qiita](https://qiita.com/yaotti/items/b64ab993c78a47941869)


**Vim: デフォルトエディタを Vim にする**

```bash
sudo update-alternatives --set editor /usr/bin/vim.basic
```

- [ISUCON7予選でやったインフラのお仕事 - Qiita](https://qiita.com/ihsiek/items/11106ce7a13e09b61547)


**sudo: unable to resolve host [IP-Address]**

```bash
sudo sh -c 'echo 127.0.1.1 $(hostname) >> /etc/hosts'
```

- [sudo: unable to resolve host が表示されたら - Qiita](https://qiita.com/ogomr/items/89e19829eb8cc08fcebb)


**journalctl: ログをみる**

```bash
sudo journalctl
sudo journalctl -u isubata.ruby.service
```


**scp**

サーバ内のファイルをローカルに持ってくる。ローカルで叩く。

```bash
scp <user-name>@<ip-address>:<server-path> <local-path>
# e.g.:
scp root@123.45.67:/home/isucon/env.sh ~/Desktop/
```
