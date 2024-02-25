class ApplicationController < ActionController::Base
  # コントローラーの認証を何処にでも適用する
  # そのうち、ログインしていないユーザーをログインページにリダイレクトする感じにする
  before_action :authenticate_user!
  # 自分のホームページなので自分のユーザー情報をセットする
  before_action :set_user
  # サイトの情報をセットする
  before_action :set_site

  # ユーザー情報をセットする
  def set_user
    @user = User.find(1)
  end

  # サイトの情報をセットする
  def set_site
    @site = Site.find(1)
  end
end
