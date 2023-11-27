class CookingTime < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
