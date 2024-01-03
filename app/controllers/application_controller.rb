class ApplicationController < ActionController::Base
  # コントローラーの認証を何処にでも適用する
  # そのうち、ログインしていないユーザーをログインページにリダイレクトする感じにする
  before_action :authenticate_user!

  # 自分のホームページなので自分のユーザー情報をセットする
  before_action :set_user

  def set_user
    @user = User.find_by(name: ENV['USER_NAME'])
  end
end
