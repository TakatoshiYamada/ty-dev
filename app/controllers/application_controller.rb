class ApplicationController < ActionController::Base
  # コントローラーの認証を何処にでも適用する
  # そのうち、ログインしていないユーザーをログインページにリダイレクトする感じにする
  before_action :authenticate_user!

  # 自分のホームページなので自分のユーザー情報をセットする
  before_action :set_user

  def set_user
    @user = User.find_by(name: ENV['USER_NAME'])
    if @user.nil?
      # dotenvで設定したユーザー名が存在しない場合は、エラーを出す
      # app直下に.envファイルを作成し、USER_NAME=自分のユーザー名を記述する
      raise "User not found. Please check your .env file."
    end
  end
end
