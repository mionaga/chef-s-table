class Recipe < ApplicationRecord
  belongs_to :end_user
  belongs_to :category
  belongs_to :cooking_time
  
  # accepts_nested_attributes_forで子カラムを一緒に保存できるようになる
  # reject_if: :all_blank　不要なカラレコードの生成を防ぐ
  # allow_destroy: trueは関連するこれコードを簡単に削除できるようにする
  has_many :recipe_ingredients, dependent: :destroy
  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true
  
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  
  has_one_attached :photo
end
