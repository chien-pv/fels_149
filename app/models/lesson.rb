class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy
  has_many :words, through: :results
  after_create :add_words

  accepts_nested_attributes_for :results

  private

  def add_words
    word_category = Word.of_category(category_id)
    words_not_learn = word_category.not_learn(user_id)
      .random(Settings.word_number)
    word_learned = word_category.learned(user_id)
      .random Settings.word_number - words_not_learn.count
    words = word_learned + words_not_learn
    words.each do |word|
      Result.create word: word, lesson_id: id
    end
  end
end
