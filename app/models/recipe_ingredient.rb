class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :category
    validates :name, :quantity, presence: true
end
