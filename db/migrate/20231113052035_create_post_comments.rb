class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :end_user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
