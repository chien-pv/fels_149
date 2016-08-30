module WordsHelper

  def category_select
    select_tag :category_id,
      options_from_collection_for_select(Category.all, :id, :name,
      params[:category_id]),
      class: "form-control", include_blank: t(".all_category")
  end
end
