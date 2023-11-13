class PostComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :recipe
  
  validates :comment, presence: true
  
end
