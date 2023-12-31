class HomeController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @blogs = Blog.all
  end
end
