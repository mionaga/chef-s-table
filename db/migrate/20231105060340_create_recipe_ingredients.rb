class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients do |t|
      t.string :name, null:false
      t.string :quantity, null:false
      t.integer :recipe_id, null:false 
      t.integer :ingredient_id, null:false 

      t.timestamps
    end
  end
end
