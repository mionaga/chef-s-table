class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.integer :recipe_id, null:false
      t.integer :number
      t.text :description, null:false

      t.timestamps
    end
  end
end
