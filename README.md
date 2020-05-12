# rails vue app
従来の（API + SPAなどではない）形式のRailsアプリケーションでありながらView層を可能な限りVueで書けるかたちにする試み  
\+  
Railsコードスニペット用サンプルアプリケーション

Rails + Vueの部分については[記事](https://qiita.com/cumet04/items/52cc84949a7ce9351317)参照

## 開発環境
`docker-compose up`して http://localhost:5000 にアクセス

* assets_path, dev:prod問題
* application.html.erbのstyleタグ
* エントリポイントjsのパス
* ビルド成果物のパス
