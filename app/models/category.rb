class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :nullify

  validates :name,  presence: true

  scope :search, -> q {where "name LIKE ?", "%#{q}%" if q.present?}
end
