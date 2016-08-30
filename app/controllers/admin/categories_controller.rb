class Admin::CategoriesController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  before_action :load_category, only: [:edit, :destroy, :update]

  def index
    @categories = Category.search(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @category.destroy
      flash.now[:success] = t "admin.categories.destroy.success"
    end
    respond_to do |format|
      format.json do
        render json:{
          flash: flash
        }
      end
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.success.update"
      redirect_to admin_categories_path
    else
      render :edit
    end
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

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
