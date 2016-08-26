class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def load_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "flash.danger.user_not_exist"
      redirect_to root_url
    end
  end
end
