class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results, dependent: :destroy

  scope :correct_anwser, -> {find_by is_correct: true}
end
