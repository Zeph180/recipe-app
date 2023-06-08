class Food < ApplicationRecord
  validates :name, presence: true

  has_many :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
end
