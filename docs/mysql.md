# MySQL


## ログの設定

ログを吐き出させる設定を `my.cnf` に書く。`my.cnf` は以下を実行して表示されるパスのどこかにあることが多い。

```bash
mysql --help | grep /my.cnf
```

`my.cnf` に、`log_output=FILE`, `general_log=1`, `general_log_file=<file_path>`, を追記する。mysql.server restart で設定を反映する。（mysql.server reload ではだめ）

```
# Default Homebrew MySQL server config
[mysqld]
# Only allow connections from localhost
bind-address = 127.0.0.1
mysqlx-bind-address = 127.0.0.1

log_output = FILE
general_log = 1
general_log_file = <ファイルのパス>
```

slow_query_logを出す設定。

```
[mysqld]
slow_query_log
slow_query_log-file = /var/log/mysql-slow.sql
long_query_time = 0.1
```

## pt-query-digest
slow_query_log を食わせると解析してくれる。

https://thinkit.co.jp/article/9617

https://tech.connehito.com/entry/2015/11/26/182040

## mysql2-cs-bind gem

https://github.com/tagomoris/mysql2-cs-bind


## dbdump

ダンプ作成

```bash
mysqldump -u user -p dbname | gzip > dbname.dump.gz 
```

転送

```bash
scp isucon@13.78.120.149:~/isucon.dump.gz ~  
```

ローカルにDB作成

```bash
$ mysql -uroot
mysql> create database isuconp;
```

リストア

```bash
gzcat isucon.dump.gz | mysql -u root isuconp
```


## 参考
1. [south37 - ISUCON Cheat Sheet](https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a)
1. [MySQLのクエリ集計手法いろいろ](https://web.archive.org/web/20190507070600/https://hiroakis.com/blog/2014/03/04/mysql%E3%81%AE%E3%82%AF%E3%82%A8%E3%83%AA%E9%9B%86%E8%A8%88%E6%89%8B%E6%B3%95%E3%81%84%E3%82%8D%E3%81%84%E3%82%8D/)
1. [pt-query-digest](https://www.percona.com/doc/percona-toolkit/2.2/pt-query-digest.html)
1. [ISUCONの勝ち方 YAPC::Asia Tokyo 2015](http://www.slideshare.net/kazeburo/isucon-yapcasia-tokyo-2015/50)
