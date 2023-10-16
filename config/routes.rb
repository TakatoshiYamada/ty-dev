Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Defines the articles resource routes
  # Add: アカウント新規登録を無効化
  devise_for :users,
    skip: [:registrations],
    controllers: {
      sessions: 'users/sessions'
    }

  # 管理画面
  namespace :admin do
    resources :dashboards, only: [:index]
  end
end
