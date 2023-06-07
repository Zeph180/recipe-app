class Inventory < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
end

class Inventory < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :inventory_foods
end
