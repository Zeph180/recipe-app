# frozen_string_literal: true

class Public < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
end
