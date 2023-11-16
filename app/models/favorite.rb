class Favorite < ApplicationRecord
  
  belongs_to :end_user
  belongs_to :recipe
  
  validates :end_user_id, uniqueness: {scope: :recipe_id}
  
end
