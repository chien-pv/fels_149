class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update, :show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.success.Signup"
      login @user
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.success.update"
      redirect_to @user
    else
      render :edit
    end
  end

  def index
    @users = User.search(params[:search]).paginate page: params[:page]
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :gender
  end
end
