class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.guest
    find_or_create_by!(email:'guest@example.com') do |end_user|
      end_user.password=SecureRandom.urlsafe_base64
      end_user.family_name = "ゲスト"
      end_user.first_name = "ゲスト"
      end_user.nickname = "ゲスト"
    end
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_one_attached :profile_image

end
