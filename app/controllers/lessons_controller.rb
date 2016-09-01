class LessonsController < ApplicationController
  def index
  end

  def create
    category = Category.find_by id: params[:category_id]
    lesson = category.lessons.create user: current_user
    if lesson
      redirect_to lesson_path(lesson)
    else
      flash[:danger] = t "lessons.create.danger"
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
  end
end
