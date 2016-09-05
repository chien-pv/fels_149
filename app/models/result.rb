class Result < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer

  scope :count_correct_answer, -> do
    joins(:answer).where("answers.is_correct = ?", true).size
  end
end
