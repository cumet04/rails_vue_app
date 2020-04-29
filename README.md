# sbox rails vue
従来の（API + SPAなどではない）形式のRailsアプリケーションでありながらView層を可能な限りVueで書けるかたちにする試み

## やりたいこと
* View層を（可能な限り）Vue.jsで記述する
* あくまでView以外は従来のRailsアプリケーションの動きにする
* API + SPA式にしない; View側でHTTPを触らず、またAPI特有の心配事を発生させない
* RailsとVue.jsの実行・ビルド環境を分離する（相互依存させない）

## ざっくり動作

### Rails側
* 表示するviewのパス情報を渡す (refs [application_helper](backend/app/helpers/application_helper.rb), [routes](backend/config/routes.rb))
* 表示データのjsonを渡す (refs [application_helper](backend/app/helpers/application_helper.rb), [application_controller#view_props](backend/app/controllers/application_controller.rb))
* 引き渡すデータを入れたスケルトンhtmlを返す (refs [layouts](backend/app/views/layouts/application.html.erb))

### Vue.js側
* ページ用Componentファイルリストよりパス情報とComponent実体のマッピングを生成しておく (refs [lib/gem-imports](frontend/lib/gen-imports.js))
* スケルトンhtmlにレイアウトComponentをmountする (refs [src/index](frontend/src/index.js))
* 引き渡されたパス情報・表示データを取り出す (refs [src/layouts/vars](frontend/src/layouts/vars.js))
* 取り出した表示データを使い、レイアウトおよびパス情報に対応するページ用Componentを描画する

## 開発環境

### 起動
```
cd backend; bundle; cd ..
cd frontned; npm ci; cd ..
docker-compose up -d
./shoreman.sh
```

http://localhost:5000 にアクセス
