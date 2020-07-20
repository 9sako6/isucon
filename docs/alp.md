# alp


アクセスログ解析ツール。[tkuchiki/alp: Access Log Profiler](https://github.com/tkuchiki/alp)


```bash
# Install
sudo apt install unzip
wget https://github.com/tkuchiki/alp/releases/download/v1.0.3/unzip alp_linux_amd64.zip
sudo mv alp /usr/local/bin/alp
sudo chown root:root /usr/local/bin/alp
```

/etc/nginx/nginx.conf の `http {}` に追記

```
log_format ltsv "time:$time_local"
                "\thost:$remote_addr"
                "\tforwardedfor:$http_x_forwarded_for"
                "\treq:$request"
                "\tstatus:$status"
                "\tmethod:$request_method"
                "\turi:$request_uri"
                "\tsize:$body_bytes_sent"
                "\treferer:$http_referer"
                "\tua:$http_user_agent"
                "\treqtime:$request_time"
                "\tcache:$upstream_http_x_cache"
                "\truntime:$upstream_http_x_runtime"
                "\tapptime:$upstream_response_time"
                "\tvhost:$host";
access_log /var/log/nginx/alp.log ltsv;
```

Nginx 再起動

```bash
sudo systemctl restart nginx
```

ベンチを実行し、統計情報を出す。

```bash
./bin/bench -remotes=127.0.0.1 -output result.json
cat /var/log/nginx/alp.log | alp ltsv --sort=sum --reverse
```

以下は起動直後の ISUCON7 予選アプリを計測した結果 (長いので途中で切ってあります)。

```
+-------+-----+-----+-----+-----+-----+--------+-----------------------------------------------------+-------+--------+---------+-------+--------+--------+-------+--------+------------+------------+-------------+------------+
| COUNT | 1XX | 2XX | 3XX | 4XX | 5XX | METHOD |                         URI                         |  MIN  |  MAX   |   SUM   |  AVG  |   P1   |  P50   |  P99  | STDDEV | MIN(BODY)  | MAX(BODY)  |  SUM(BODY)  | AVG(BODY)  |
+-------+-----+-----+-----+-----+-----+--------+-----------------------------------------------------+-------+--------+---------+-------+--------+--------+-------+--------+------------+------------+-------------+------------+
|    30 |   0 |   2 |   0 |  28 |   0 | GET    | /icons/ae8893170459dc68063b942c49cc0b2be78f6b47.png | 0.184 | 10.004 | 268.796 | 8.960 |  0.184 | 10.000 | 2.787 |  2.573 |      0.000 | 227840.000 |  455680.000 |  15189.333 |
|    29 |   0 |   4 |   0 |  25 |   0 | GET    | /icons/5e981ef46ec0f47bdc2f188673325b85078f5235.png | 0.200 | 10.004 | 259.735 | 8.956 |  0.200 | 10.001 | 7.341 |  2.388 |      0.000 | 768501.000 | 3074004.000 | 106000.138 |
|    28 |   0 |   3 |   0 |  25 |   0 | GET    | /icons/2716e8a567c6eb3bab842e5b82940e795583ce59.png | 2.835 | 10.008 | 255.358 | 9.120 | 10.000 |  9.997 | 6.991 |  1.727 |      0.000 | 426930.000 | 1280790.000 |  45742.500 |
|    29 |   0 |   3 |   0 |  26 |   0 | GET    | /icons/7598595abd317f5ae637300a27f95e3c700376a7.png | 0.254 | 10.003 | 252.675 | 8.713 |  0.254 | 10.000 | 6.908 |  2.497 |      0.000 | 436866.000 | 1310598.000 |  45193.034 |
|    31 |   0 |   7 |   0 |  24 |   0 | GET    | /icons/9ffcd7cee7e5947b204db47c5738150e09e685e1.png | 0.191 | 10.004 | 249.818 | 8.059 |  0.191 | 10.001 | 1.971 |  3.084 |      0.000 | 202359.000 | 1416513.000 |  45693.968 |
...
```

# Metrix

|Metrix   |Description|
|:--------|:----------|
|COUNT    |そのURIにアクセスがあった回数|
|1XX      |HTTPステータスコード100番台が返ったアクセスの数|
|2XX      |HTTPステータスコード200番台が返ったアクセスの数|
|3XX      |HTTPステータスコード300番台が返ったアクセスの数|
|4XX      |HTTPステータスコード400番台が返ったアクセスの数|
|5XX      |HTTPステータスコード500番台が返ったアクセスの数|
|METHOD   |そのURIをどのメソッドで呼び出したか|
|URI      |計測対象となるURI|
|MIN      |そのURIへのアクセスにかかった最小の時間|
|MAX      |そのURIへのアクセスにかかった最大の時間|
|SUM      |そのURIへの全アクセスにかかった時間の合計|
|AVG      |そのURIへの全アクセスにかかった時間の平均|
|P1       |1パーセンタイル|
|P50      |50パーセンタイル|
|P99      |99パーセンタイル|
|STDDEV   |標準偏差|
|MIN(BODY)|そのURIが返した最小のレスポンスボディ(クライアントに転送したバイト数のうち, レスポンスヘッダのバイト数を引いたもの)のサイズ|
|MAX(BODY)|そのURIが返した最大のレスポンスボディのサイズ|
|SUM(BODY)|そのURIが返した全てのレスポンスボディの合計|
|AVG(BODY)|そのURIが返した全てのレスポンスボディの平均|

Metrix の説明は [ISUCON 5でalpを使ってNginxのログを解析した話 - Masteries](https://papix.hatenablog.com/entry/2015/09/28/094310)、 [alpのインストールからNginxのアクセスログ解析までの手順【ISUCON】 | Enjoy IT Life](https://nishinatoshiharu.com/install-alp-to-nginx/) を参考にした。


## 参考
1. [tkuchiki/alp: Access Log Profiler](https://github.com/tkuchiki/alp)
1. [alp/usage_samples.md at master · tkuchiki/alp](https://github.com/tkuchiki/alp/blob/master/docs/usage_samples.md)
1. [ISUCON 5でalpを使ってNginxのログを解析した話 - Masteries](https://papix.hatenablog.com/entry/2015/09/28/094310)
1. [alpのインストールからNginxのアクセスログ解析までの手順【ISUCON】 | Enjoy IT Life](https://nishinatoshiharu.com/install-alp-to-nginx/)
