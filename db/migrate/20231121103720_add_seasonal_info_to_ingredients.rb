class AddSeasonalInfoToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :seasonal_info, :text
  end
end
