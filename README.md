# コンメシ（コンビニご飯レビュー＆栄養管理アプリ）

[![Image from Gyazo](https://i.gyazo.com/fe96d007c5d1fa1cb12f948be56cfc2f.png)](https://gyazo.com/fe96d007c5d1fa1cb12f948be56cfc2f)

# What(これは何？)

当アプリは、コンビニで販売されている食品をテーマにしたアプリです。2つの機能を統合している点が特徴です。

* ユーザーレビューを参考にできるコンビニご飯特化型情報アプリ
* 栄養摂取目安量と実際の摂取量を比較できる健康管理アプリ 

2つの機能を統合することにより、カロリーや炭水化物などの撮り過ぎを気にしつつ、何を食べれば良いかを決めることができます。登録ユーザーが増えることでユーザビリティが向上するとともにユーザー単独でも栄養管理アプリとして活用できる点がメリットです。

# Why(なぜ作ったのか？)

コンビニで食品を買う際、できるだけ低カロリー、低炭水化物で高タンパク質の商品を選びたいため時間をかけることが多く、味にもこだわりたいため悩みの種でした。このような経緯から、商品の栄養成分を容易に把握・比較することができ、他の方の感想も知ることができ、さらに栄養管理もできる一石三鳥のアプリがあれば便利なのではないかと考え、開発しました。

# 実装機能

* ユーザー登録（ウィザード形式）機能および編集機能
* ユーザー情報に基づいた1日の栄養摂取目安量の表示（カロリー、タンパク質、脂質、炭水化物、塩分）
* 商品の登録・編集機能
* 商品の検索機能（商品名、ジャンル、販売店の複合条件）
* 商品レビューの投稿・編集・削除機能
* 商品の食事予定リストへの追加・削除機能（ECサイトでいうカート機能を想定）
* 食事予定リストの食事記録への移行機能（ECサイトでのカート商品を購入履歴に反映させる機能を想定）
* 食事記録に基づいた当日の栄養摂取量と摂取目安量の比較機能

# 画面サンプル
|マイページ画面|登録商品リスト画面| 
|:-------:|:--------:|
[![Image from Gyazo](https://i.gyazo.com/fe96d007c5d1fa1cb12f948be56cfc2f.png)](https://gyazo.com/fe96d007c5d1fa1cb12f948be56cfc2f)  |[![Image from Gyazo](https://i.gyazo.com/8cb9d5c354889a9fd6c829d9f78448e2.png)](https://gyazo.com/8cb9d5c354889a9fd6c829d9f78448e2)|

|商品検索結果|商品詳細画面|
|:-------:|:--------:|
|[![Image from Gyazo](https://i.gyazo.com/667edfee152681c32cb0c3524cce9985.png)](https://gyazo.com/667edfee152681c32cb0c3524cce9985)|[![Image from Gyazo](https://i.gyazo.com/52da1775734126867144f00b822d4264.png)](https://gyazo.com/52da1775734126867144f00b822d4264)|

|食事予定リスト画面（擬似カート）|食事記録画面|
|:-------:|:--------:|
|[![Image from Gyazo](https://i.gyazo.com/e005fd494854031ae5bd13ee2362f36f.png)](https://gyazo.com/e005fd494854031ae5bd13ee2362f36f)|[![Image from Gyazo](https://i.gyazo.com/5a68b3063583a3f89ae41fc2be5a77f7.png)](https://gyazo.com/5a68b3063583a3f89ae41fc2be5a77f7)|

# リンク
http://52.69.21.59/

## テストアカウント
<p>メールアドレス：test@test.com</p>
パスワード：test123

# 使用言語・ツール

* HTML(Haml)
* CSS(SCSS)
* Ruby on Rails 
* BootStrap
* MySQL
* AWS(EC2, S3)

# ER図
[![Image from Gyazo](https://i.gyazo.com/6315f8d9d3632effdca61b28e2556dfd.png)](https://gyazo.com/6315f8d9d3632effdca61b28e2556dfd)