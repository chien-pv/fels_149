class Word < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy

  default_scope -> {order(created_at: :desc)}
end
