Rails.application.routes.draw do
  get 'blogs/index'
  get 'blogs/show'
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

  # ランディングページ表示
  resources :landing_pages, only: [:index]

  # ブログ記事表示
  # 一般ユーザーが閲覧する
  resources :blogs, only: [:index, :show]

  # 管理画面
  namespace :admin do
    # topページ
    # 各種管理画面へのリンクを表示する
    resources :dashboards, only: [:index]
    # ランディングページ管理
    # ランディングページの編集・削除を行う
    resources :landing_pages, only: [:index, :edit, :update, :destroy]
    # ブログ管理
    resources :blogs
  end

end
