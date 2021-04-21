class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, :password_confirmation, format:{with:/\A([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])\z/i}
  validates :first_name, presence: true, format:{with:/\A[ぁ-んァ-ヴ一-龥]+\z/}
  validates :family_name, presence: true, format:{with:/\A[ぁ-んァ-ヴ一-龥]+\z/}
  validates :first_name_kana, presence: true, format:{with:/\A[ァ-ヴ]+\z/}
  validates :family_name_kana, presence: true, format:{with:/\A[ァ-ヴ]+\z/}
  validates :birth, presence: true
  
end
