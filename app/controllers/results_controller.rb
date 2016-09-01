class ResultsController < ApplicationController

  def show
    @lesson = Lesson.find_by id: params[:id]
    @results = @lesson.results
    @correct_answer = @results.count_correct_answer
  end
end
