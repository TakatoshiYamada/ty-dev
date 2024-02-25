class ListsController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lists = List.all
  end
end
