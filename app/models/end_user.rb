class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image

  validates:family_name, :first_name, presence: true
  validates:nickname,uniqueness:true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end


  GUEST_USER_EMAIL = "guest@example.com"
    def self.guest
      find_or_create_by!(email: GUEST_USER_EMAIL) do |end_user|
        end_user.password=SecureRandom.urlsafe_base64
        end_user.family_name = "ゲスト"
        end_user.first_name = "ゲスト"
        end_user.nickname = "ゲスト"
      end
    end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.looks(search, word)
    if search == 'parfect'
      end_users = EndUser.where("nickname Like?", "#{word}")
    elsif search == 'forward'
      end_users = EndUser.where("nickname Like?", "#{word}%")
    elsif search == 'backward'
      end_users = EndUser.where("nickname Like?", "%#{word}")
    else search == 'partial'
      end_users = EndUser.where("nickname Like?", "%#{word}%")
    end
  end



end
