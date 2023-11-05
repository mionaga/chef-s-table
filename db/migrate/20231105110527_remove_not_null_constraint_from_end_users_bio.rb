class RemoveNotNullConstraintFromEndUsersBio < ActiveRecord::Migration[6.1]
  def change
    change_column :end_users, :bio, :text, null: true
  end
end
