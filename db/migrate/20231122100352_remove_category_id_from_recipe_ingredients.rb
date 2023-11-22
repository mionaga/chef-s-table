class RemoveCategoryIdFromRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipe_ingredients, :category_id, :integer
  end
end
