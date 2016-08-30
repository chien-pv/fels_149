class CategoriesController < ApplicationController
  def index
    @categories = Category.search(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page_category
  end
end
