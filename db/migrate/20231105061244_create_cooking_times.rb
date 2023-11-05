class CreateCookingTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_times do |t|
      t.string :time_in_minuites

      t.timestamps
    end
  end
end
