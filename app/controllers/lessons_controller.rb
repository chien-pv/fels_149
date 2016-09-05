class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update]

  def index
    @lessons = current_user.lessons.paginate page: params[:page]
  end

  def create
    category = Category.find_by id: params[:category_id]
    lesson = category.lessons.create user: current_user
    if lesson
      redirect_to lesson_path lesson
    else
      flash[:danger] = t "lessons.create.danger"
      redirect_to categories_path
    end
  end

  def update
    if @lesson.update lesson_params.merge is_complete: true
      redirect_to result_path @lesson
    else
      flash[:danger] = t "results.update.fail"
      render lesson_path @lesson
    end
  end

  def show
  end

  private

  def lesson_params
    params.require(:lesson).permit results_attributes: [:id, :answer_id]
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:id]
  end
end
