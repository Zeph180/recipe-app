class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :recipe_foods
end
