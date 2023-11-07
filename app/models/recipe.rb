class Recipe < ApplicationRecord
  belongs_to :end_user
  belongs_to :category
  
  has_one_attached :photo
end
