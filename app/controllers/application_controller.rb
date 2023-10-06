class ApplicationController < ActionController::Base
  # コントローラーの認証を何処にでも適用する
  # そのうち、ログインしていないユーザーをログインページにリダイレクトする感じにする
  before_action :authenticate_user!
end
