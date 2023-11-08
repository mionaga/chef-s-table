class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    
    validates :namme, :quantity, presence: true
end
