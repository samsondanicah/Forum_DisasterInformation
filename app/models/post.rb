class Post < ApplicationRecord
  validates :title, :content, :address, presence: true

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
end