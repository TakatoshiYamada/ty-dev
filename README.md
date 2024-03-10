# Takatoshi Yamada Archives

## 概要

- プロフィール
  - 経歴の棚卸し

- リスト
  - 興味の棚卸し
  - iPhoneに膨れ上がったメモの整理
  - 読書記録リスト
　- 美味しかった酒のリストなどなど

### 現在実装中の機能:

- ホームページ
  - プロフィール
  - 好きな言葉リスト

### 現在実装予定の機能

- ブログ作成・管理
- 読んできた本リスト
  - 技術
  - 趣味
- 気になるウェブサイト
- 見たい映画
- 見た映画

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

## TDD

1. 網羅したいテストシナリオのリスト（テストリスト）を書く
2. テストリストの中から「ひとつだけ」選び出し、実際に、具体的で、実行可能なテストコードに翻訳する
3. プロダクトコードを変更し、いま書いたテスト（と、それまでに書いたすべてのテスト）を成功させる（その過程で気づいたことはテストリストに追加する）
4. 必要に応じてリファクタリングを行い、実装の設計を改善する
5. テストリストが空になるまでステップ2に戻って繰り返す

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