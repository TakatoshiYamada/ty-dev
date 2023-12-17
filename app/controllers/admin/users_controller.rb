# app/controllers/admin/users_controller.rb

class Admin::UsersController < AdminController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [:show, :edit, :update]

  # 現在のユーザー情報を表示
  def show
  end

  def edit
  end

  # 現在のユーザー情報を更新
  def update
    if @user.update(user_params)
      # 更新に成功した場合の処理
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      # 更新に失敗した場合の処理
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  # Strong Parametersを使用して、安全にユーザー情報を更新
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :admin)
  end
end
