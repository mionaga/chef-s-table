class Ingredient < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  
  validates :name, presence: true
  validates :description, :seasonal_info, presence: true
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  
end
