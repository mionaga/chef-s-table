class Public::HomesController < ApplicationController
  def top
    @new_recipes = Recipe.order(created_at: :desc).limit(3)
    
  end

  def about
  end
end
