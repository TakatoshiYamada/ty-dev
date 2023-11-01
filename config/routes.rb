Rails.application.routes.draw do
  get 'home/index'

  # ホーム画面の表示
  root to: 'home#index'

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

  # ブログ記事表示
  # 一般ユーザーが閲覧する
  resources :blogs, only: [:index, :show]

  # 管理画面
  namespace :admin do
    # 各種管理画面へのリンクを表示する
    resources :dashboards, only: [:index]
    # ブログ管理
    resources :blogs
  end

end
