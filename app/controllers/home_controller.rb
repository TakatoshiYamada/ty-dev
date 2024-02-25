class HomeController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Menuの項目を表示するためのデータを取得
    @lists = List.all
  end
end
