class PostComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :recipe
  #コメント返信機能のため下記2行追加
  belongs_to :parent, class_name: "PostComment", optional: true
  has_many :replies, class_name: "PostComment", foreign_key: :parent_id, dependent: :destroy
  
  validates :comment, presence: true
  
end
