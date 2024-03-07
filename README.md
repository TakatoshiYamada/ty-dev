# 自家製実験用アプリケーション Takatoshi Yamada Archives

## 概要

### 現在実装中の機能:

- ホームページ
  - プロフィール
  - 好きな言葉リスト

### 現在実装予定の機能

- ブログ作成・管理
- 読んできた本リスト
  - 技術
  - 趣味
- 気になる本
- 気になるウェブサイト

## 機能説明

### プロフィール

入れたい項目
- 自分の顔写真
- 各種SNSリンクなどの連絡先
- 経歴とか？

### 

## 技術スタック

- バックエンド
  - Ruby
  - Ruby on Rails
  - MySQL
  - Docker
  - Nginx
- フロントエンド
  - HTML
  - CSS
  - JavaScript
  - Tailwind
  - DaisyUI

## 作業用メモ

### フロントエンド更新

- yarn upgrade後、rails assets:precompileをする

```bash
yarn upgrade tailwindcss --latest
rails assets:precompile
```

### Hoge (call 'Hoge.connection' to establish a connection)エラー対処

```pry
ActiveRecord::Base.clear_cache!
```