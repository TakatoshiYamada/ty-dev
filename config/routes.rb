Rails.application.routes.draw do
  # deviseによる認証機能のルーティングを自動生成
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Defines the articles resource routes
  devise_for :users,
    # Add: アカウント新規登録を無効化
    skip: [:registrations],
    # Add: ログイン・ログアウト後のルーティングを変更
    # Notes: Users::SessionsController < Devise::SessionsControllerにて定義
    controllers: {
      sessions: 'users/sessions'
    }

  # 一般ユーザー用のルーティング
  # ホーム画面表示
  root to: 'home#index'

  # ユーザー情報を表示
  resources :users, only: [:show]

  # リスト表示
  resources :lists, only: [:index]

  # ブログ記事表示
  resources :blogs, only: [:index, :show] do
    resources :articles, only: [:show]
  end

  # 管理者用のルーティング
  namespace :admin do
    # 管理画面ダッシュボード
    ## 各種管理画面へのリンク
    resources :dashboards, only: [:index]
    # ユーザーの管理
    resources :users, only: [:show, :edit, :update]
    # ユーザーサイトの管理
    resources :sites, only: [:show, :edit, :update]
    # ブログの管理
    resources :blogs do
      # 記事の管理
      resources :articles
    end
  end

end
