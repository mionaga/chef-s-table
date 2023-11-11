class AddCategoryIdToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipe_ingredients, :category, foreign_key: true
  end
end
