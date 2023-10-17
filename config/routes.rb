Rails.application.routes.draw do
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
    resources :dashboards, only: [:index]
  end
end
