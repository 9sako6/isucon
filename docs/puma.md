# puma

設定ファイルを指定して起動できる。

```bash
puma -C ./puma.conf.rb
```

## `puma.conf.rb`


```ruby
stdout_redirect '/home/isucon/puma.out', '/home/isucon/puma.err', true
```
