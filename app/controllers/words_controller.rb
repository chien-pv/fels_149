class WordsController < ApplicationController
  def index
    @words = Word.paginate page: params[:page], per_page: Settings.per_page
    @categories = Category.all
  end
end
