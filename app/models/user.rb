class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :recipes
  has_many :inventories

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role
  end
end
