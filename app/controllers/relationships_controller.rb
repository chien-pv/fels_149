class RelationshipsController < ApplicationController
  before_action :load_user, only: :show

 def create
    @user = User.find_by id: params[:followed_id]
    if @user.nil?
      flash[:danger] = t "follow.not_user"
      redirect_to current_user
    else
      current_user.follow @user
      respond_to do |format|
        format.json do
          render json: @user
        end
      end
    end
  end

  def show
    @title = t "user.follower_title"
    @users = @user.send("#{params[:message]}").paginate page: params[:page]
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:id]).followed
    if @user.nil?
      flash[:danger] = t "follow.not_user"
      redirect_to current_user
    else
      current_user.unfollow @user
      respond_to do |format|
        format.json do
          render json:@user
        end
      end
    end
  end
end
