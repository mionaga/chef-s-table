class Recipe < ApplicationRecord

  belongs_to :end_user
  belongs_to :cooking_time
  has_one_attached :photo

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
 
  belongs_to :tag
  # accepts_nested_attributes_forで子カラムを一緒に保存できるようになる
  # reject_if: :all_blank　不要なカラレコードの生成を防ぐ
  # allow_destroy: trueは関連するこれコードを簡単に削除できるようにする
  has_many :recipe_ingredients, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true
  has_many :categories, through: :recipe_ingredients, dependent: :destroy

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  
  validates :title, presence: true
  validates :description, presence: true
  validates :tag, presence:true
  validates :cooking_time, presence:true



  def get_photo(width, height)
    unless photo.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      photo.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    photo.variant(resize_to_fill: [width, height], gravity: :center).processed
  end

   def favorited_by?(end_user)
     end_user.present? && favorites.exists?(end_user_id: end_user.id)
   end

   def self.liked_recipes(end_user, page, per_page)
     includes(:favorites)#favoritesテーブルを統合
       .where(favorites: { end_user_id: end_user.id })
       .order(created_at: :desc)
       .page(page)
       .per(per_page)
   end
   
   def self.looks(search, word)
    if search == 'parfect'
      recipes = Recipe.where("title Like?", "#{word}")
    elsif search == 'forward'
      recipes = Recipe.where("title Like?", "#{word}%")
    elsif search == 'backward'
      recipes = Recipe.where("title Like?", "%#{word}")
    else search == 'partial'
      recipes = Recipe.where("title Like?", "%#{word}%")
    end
  end


end
