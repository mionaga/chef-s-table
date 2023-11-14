class AddTagIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :tag_id, :integer
  end
end
