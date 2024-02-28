class UsersController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:show]
  has_one_attached :avatar

  def show
    @user = User.last
  end
end
