class Admin::WordsController < ApplicationController
  before_action :authenticate!, :authenticate_admin!

  def index
    @categories = Category.all
    @words = Word.of_category(params[:category_id]).search(params[:search])
      .paginate(page: params[:page], per_page: Settings.per_page)
  end

  def new
    @word = Word.new
    4.times{@word.answers.build}
  end

  def create
    @category = Category.find_by id: params[:category_id]
    if @category
      @word = @category.words.new word_params
      if @word.save
        flash[:success] = "success"
        redirect_to admin_words_path
      else
        4.times{@word.answers.build}
        render :new
      end
    else
      flash[:danger] = t "admin.words.category"
      redirect_to new_admin_word_path
    end
  end

  private

  def word_params
    params.require(:word).permit(:content,
      answers_attributes: [:id, :content, :is_correct])
  end
end
