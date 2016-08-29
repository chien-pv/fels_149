class Admin::CategoriesController < ApplicationController
  before_action :authenticate!, :authenticate_admin!

  def index
    @categories = Category.search(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.success.create"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

end
