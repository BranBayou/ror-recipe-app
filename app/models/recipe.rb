class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'user_id'

  validates :name, presence: true
end
