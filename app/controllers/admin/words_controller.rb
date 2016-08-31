class Admin::WordsController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  before_action :load_word, only: [:destroy, :edit, :update]

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
        flash[:success] = t "admin.words.flash.success"
        redirect_to admin_words_path
      else
        4.times{@word.answers.build}
        render :new
      end
    else
      flash[:danger] = t "admin.words.flash.category"
      redirect_to new_admin_word_path
    end
  end

  def edit
  end

  def update
    if @word.update(word_params)
      flash[:success] = t "admin.words.flash.update"
      redirect_to admin_words_path
    else
      render :edit
    end
  end

  def destroy
    if @word.destroy
      flash.now[:success] = t "admin.words.flash.delete"
    end
    respond_to do |format|
      format.json do
        render json:{
          flash: flash
        }
      end
    end
  end

  private

  def word_params
    params.require(:word).permit(:content,
      answers_attributes: [:id, :content, :is_correct])
  end

  def load_word
    @word = Word.find_by id: params[:id]
  end
end
