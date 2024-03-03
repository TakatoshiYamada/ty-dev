class UsersController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.last
  end
end
