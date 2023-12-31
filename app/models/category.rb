class Category < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
