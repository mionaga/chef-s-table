class Category < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
