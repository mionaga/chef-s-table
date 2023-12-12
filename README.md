# Chef's Table
​
## サイト概要
### サイトテーマ
料理人をメインターゲットとした賄いレシピのコミュニティサイト
### テスト用アカウント
- 管理者  
  メールアドレス：admin@admin  
  パスワード：testtest
- エンドユーザー  
  メールアドレス：yamada1@yamada  
  パスワード：password
### テーマを選んだ理由
​前職で料理人として働いた経験をもとに、コックさんが毎日の賄い作りに悩んでいる様子から着想を得て、美味しい賄いのレシピ集を作成することを考えました。
料理人の賄い作りには特殊な課題があります。食材の自由な調達が難しく、毎日大量に発生するお店の端材（例：大根のヘタ、舞茸やエリンギの軸、牛フィレサイド肉、牛すじや魚のヘタなど）を上手に活用して従業員に満足してもらえる料理を作らなければなりません。
下処理の難しい食材でも、食材の特性を活かしたレシピを共有することは若い料理人さんの学びの機会にもなります。
一般の方も投稿可能ですが、プロの料理人は自身の専門料理をプロフィールに記入することができます。
このサイトの主な目的は、使いづらい食材を活用したレシピ集を提供することです。
### ターゲットユーザ
- 賄い制作での自分の学びを発信したい料理人
- 日々の賄い作りで余り物食材の活用に悩む料理人
- 冷蔵庫の余り物で美味しい料理を作りたいユーザー

### 主な利用シーン
- 決まった端材ばかり抱えて処理に悩む飲食店が活用方法を検索するとき
- 賄い作りに悩む若いコックさんがレシピや所要時間を知りたいとき
- プロの料理人から一般のユーザーまでが食材とレシピを通じてコミュニケーションできる場所として

​
## 設計書
### ER図
<img width="1203" alt="Shef'sTableER " src="https://github.com/mionaga/chef-s-table/assets/143914849/4a5344d4-f169-485e-a548-949feca8fb7e">


### テーブル定義書URL：https://docs.google.com/spreadsheets/d/1L_06JCA0JrjDKFemQOLMq-Oq5NUd4aa8/edit?usp=sharing&ouid=117497397567172446549&rtpof=true&sd=true

## 実装機能一覧
- ゲストログイン機能
- 会員機能
- レシピ投稿機能
- 投稿検索機能（キーワード検索・タグ検索・所要時間検索）
- レシピ投稿フォームを非同期で追加・削除
- いいね機能/いいね一覧表示機能
- コメント機能
- コメント返信機能
- コメント通知機能
- 管理者機能（会員ステータス管理・投稿管理・コメント管理）

​
## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
​
## 使用素材
- フリー画像としてPixabayを使用

## About
<img width="1461" alt="about 2023-12-11 10 04 05" src="https://github.com/mionaga/chef-s-table/assets/143914849/a437dc14-2769-4fb5-aefc-918e1848a9e8">
