# Systemd

## 参照実装の切り替え方法
ISUCON でよくある参照実装の切り替え方法。

```bash
# e.g.: ISUCON7
sudo systemctl stop isubata.python.service
sudo systemctl disable isubata.python.service
sudo systemctl start isubata.ruby.service
sudo systemctl enable isubata.ruby.service
```

再起動。

```bash
sudo systemctl restart isubata.ruby.service
```

設定ファイルの変更を反映して再起動。

```bash
systemctl daemon-reload
systemctl restart isubata.ruby.service
```

## 設定ファイルの場所

`/etc/systemd/system/`

## 参考

1. [ISUCON7予選 当日マニュアル.md](https://gist.github.com/941/8c64842b71995a2d448315e2594f62c2)
