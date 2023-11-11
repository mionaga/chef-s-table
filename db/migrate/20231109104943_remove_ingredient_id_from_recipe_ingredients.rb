class RemoveIngredientIdFromRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipe_ingredients, :ingredient_id, :integer
  end
end
