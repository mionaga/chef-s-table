class Recipe < ApplicationRecord
  belongs_to :end_user
  
  has_one_attached :photo
end
