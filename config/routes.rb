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

  # 管理画面
  namespace :admin do
    # topページ
    resources :dashboards, only: [:index]
    # ブログ記事管理
    resources :blogs, except: [:index, :show]
  end

  # ブログ記事表示
  resources :blogs, only: [:index, :show]
end
