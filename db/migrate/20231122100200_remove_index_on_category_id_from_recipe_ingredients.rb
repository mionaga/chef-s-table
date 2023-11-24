class RemoveIndexOnCategoryIdFromRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_index :recipe_ingredients, column: :category_id
  end
end
