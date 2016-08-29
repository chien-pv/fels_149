class Admin::UsersController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  before_action :load_user, only: :destroy

  def index
    @users = User.not_admin.search(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @user.destroy
      flash.now[:success] = t "admin.users.destroy.success"
    else
      flash.now[:error] = t "admin.users.destroy.danger"
    end
  end

  private

  def load_user
    @user = User.find_by params[:id]
    if @user.nil?
      flash[:danger] = t "flash.danger.user_not_exist"
      redirect_to admin_users_url
    end
  end
end
